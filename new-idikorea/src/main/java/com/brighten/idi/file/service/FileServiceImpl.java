package com.brighten.idi.file.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.brighten.idi.enumerate.YesNo;
import com.brighten.idi.file.dto.FileDto;
import com.brighten.idi.file.mapper.FileMapper;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;


@Tag(name = "파일")
@Service
@RequiredArgsConstructor
public class FileServiceImpl implements FileService {
	
    private String host = "idikorea1.cdn3.cafe24.com";            // FTP 접속 호스트
    private String username = "idikorea1";        // FTP 로그인 id
    private String password = "cfic1208"; 
	
	@Value("${auth.upload}")
	String propertyPath;
	
	private final FileMapper fileMapper;
	
	@Override
	public Long register(MultipartFile file, String dir) throws Exception {
		return register(file, dir,  null, null);
	}

	@Override
	public Long register(MultipartFile file, String dir, Integer i, Long groupId) throws Exception {
		System.err.println(propertyPath);
		if(file==null)
			return null;
		if(file.isEmpty())
			return null;
		if(i==null)
			i=0;
		if(dir == null)
			dir = "default";

		FileDto fileDto = new FileDto();
		
		String originalName = file.getOriginalFilename();
		String extention = originalName.substring(originalName.lastIndexOf(".") + 1);
		String contentType = file.getContentType();
		String currentPath = new File("").getAbsolutePath().replace("\\", "/") + "/";
		String folderPath = currentPath + propertyPath + "/" + dir + "/";
//		String folderPath = propertyPath + "/" + dir + "/";
		String name = String.valueOf(System.currentTimeMillis()); //파일이름
		String urlPath = folderPath + name+"."+extention;
		File folder = new File(folderPath);		
		fileDto.setContentType(contentType);
		fileDto.setOriginName(originalName);
		fileDto.setExtention(extention);
		fileDto.setName(name+"."+extention);
		fileDto.setSize(file.getSize());
		fileDto.setSort(i);
		fileDto.setFileGroupId(groupId);
		fileDto.setEnabled(YesNo.Y);
		fileDto.setDir(dir);
//		init();
//		upload(dir,folder);

		if(!folder.exists())
		folder.mkdirs();

		Path filePath = Paths.get(urlPath);
		Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);//톰캣폴더에서 만든 폴더로 옮기는거		
		
		connect(urlPath,"/www/"+dir+"/"+  name+"."+extention);
		
		System.err.println(folder.getName()+"."+extention);
		System.err.println(folder.getPath());
		System.err.println(folder.getAbsolutePath());
		File deleteFile = new File(urlPath);
		deleteFile.delete();
		
		fileMapper.register(fileDto);
//		
//		if(!folder.exists())
//			folder.mkdirs();
//
//		Path filePath = Paths.get(urlPath);
//		Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);//톰캣폴더에서 만든 폴더로 옮기는거
		
		return fileDto.getId();
	}

	@Override
	public FileDto get(Long id) throws Exception {
		return fileMapper.get(id);
	}

	@Override
	public boolean remove(Long fileId) throws Exception {
		//실제파일삭제하기
		FileDto fileDto=get(fileId);
		
		//로컬저장소 일경우
//		String currentPath = new File("").getAbsolutePath().replace("\\", "/") + "/";
//		String dir = currentPath + propertyPath + "/" + fileDto.getDir() + "/";
//		File file = new File(dir+fileDto.getName());
//		file.delete();
		
		//외부저장소 
		String filePath = host+"/www"+fileDto.getDir()+"/"+  fileDto.getName();
//		String filePath = host+"/www/"+fileDto.getDir();
//		filePath = filePath.replaceAll("//", "/");
		FTPClient ftpClient = new FTPClient(); 
		ftpClient.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));
		ftpClient.connect(host,21);
        boolean login = ftpClient.login(username, password);
        ftpClient.enterLocalPassiveMode();
        System.out.println("Current directory: " + ftpClient.printWorkingDirectory());
        System.err.println(login);
        FTPFile[] files = ftpClient.listFiles("/www/test/prod/");
        boolean flag = false;
        for (FTPFile file : files) {
            System.out.println("File: " + file.getName());
            if(file.getName().equals(fileDto.getName()))
            	flag=true;
        }
        //삭제할파일이 존재하지않으면 db에서 로우 삭제
        if(flag == false) {
        	fileMapper.remove(fileId);
        	return true;
        }

        // 파일 삭제
        String remoteFilePath = fileDto.getName(); // 상대 경로 사용
        boolean deleted = ftpClient.deleteFile("/www/test/prod/" + remoteFilePath);
        if (deleted) {
            System.out.println("The file was deleted successfully.");
        } else {
            System.out.println("Could not delete the file, it may not exist.");
        }
        System.err.println(deleted);
        if (deleted) {
        	ftpClient.logout();
        	ftpClient.disconnect();
        	fileMapper.remove(fileId);
        	return true;
        } else {
            return false;
        }
	}
	
    //FTP connect 
    public FTPClient connect(String local , String remote) throws IOException {
    	
    	FTPClient ftpClient = new FTPClient();
    	ftpClient.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));
        try {
            ftpClient.connect(host, 21);
            int replyCode = ftpClient.getReplyCode();
            if (!FTPReply.isPositiveCompletion(replyCode)) {
                throw new IOException("Failed to connect to FTP server. Reply code: " + replyCode);
            }

            boolean login = ftpClient.login(username, password);
            if (!login) {
                throw new IOException("Failed to login to FTP server with user " + username);
            }

            ftpClient.enterLocalPassiveMode();
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

            makeDirectory(ftpClient , remote ); 
            
            File localFile = new File(local);
            try (FileInputStream inputStream = new FileInputStream(localFile)) {
                boolean done = ftpClient.storeFile(remote, inputStream);
                if (!done) {
                    throw new IOException("Failed to upload file to FTP server.");
                }
            }
        } catch (IOException e) {
            throw e;
        } finally {
            if (ftpClient.isConnected()) {
                try {
                    ftpClient.logout();
                    ftpClient.disconnect();
                } catch (IOException ex) {
                    System.err.println("Failed to disconnect from FTP server: " + ex.getMessage());
                }
            }
        }    	
        return null;                                            // client 객체 반환
    }
    
    //파일서버에 해당 디렉토리 존재하는지 확인
    public void makeDirectory(FTPClient ftpClient , String remote) {
        try {
			if (!ftpClient.changeWorkingDirectory(remote)) {
			    String[] pathElements = remote.split("/");
			    if (pathElements != null && pathElements.length > 0) {
			        StringBuilder currentPath = new StringBuilder();
			        for (String singleDir : pathElements) {
			        	if(singleDir.contains("."))
			        		break;
			            currentPath.append("/").append(singleDir);
			            if (!ftpClient.changeWorkingDirectory(currentPath.toString())) {
			                if (ftpClient.makeDirectory(currentPath.toString())) {
			                    ftpClient.changeWorkingDirectory(currentPath.toString());
			                } else {
			                    throw new IOException("Failed to create directory: " + currentPath);
			                }
			            }
			        }
			    }
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
	
	


}
