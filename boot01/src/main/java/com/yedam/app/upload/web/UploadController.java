package com.yedam.app.upload.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	// 환경병수 및 Properties 파일의 변수 값을 Read(읽어오기)
	@Value("${file.upload.path}") // 메모리에 올라가 있는 변수값을 가져오기 때문에 표현이 다름
	private String uploadPath;
	// java -jar -Dfile.upload.path=D:/upload/ boot01.jar  // 실제로 배포할때는 이렇게 된다. 변경이 될 값들이나 보안적으로 숨길때는 이렇게 해야한다.
	
	@GetMapping("formUpload")
	// 메소드에 void가 있을 경우에는 위에 GetMapping 자체가 경로라는 의미이다.
	public void formUploadPage() {
		System.out.println(uploadPath);
	} // end formUploadPage
	// classpath : /templates/formUpload.html
	
	// 1. submit 방식(form 태그 방식)
	
	@PostMapping("uploadForm")
	//Controller의 매개변수명과 페이지(화면)의 file의 name이 일치해야한다.
	// form 에서 multiple을 하게되면 배열로 받아야 한다.
	public String formUploadFile(@RequestPart MultipartFile[] files) {
		for(MultipartFile file : files) {
			System.out.println(file.getOriginalFilename()); // 파일이름
			System.out.println(file.getContentType()); // 파일종류
			System.out.println(file.getSize()); // 파일크기
			System.out.println("");
			String fileName = file.getOriginalFilename();
			String saveName = uploadPath + fileName; // File.separator : / 를 의미한다.
			
			System.out.println("saveName: " + saveName);
			Path savePath = Paths.get(saveName);
			
			try {
				file.transferTo(savePath);
			} catch (IOException e) {
				e.printStackTrace();
			} // 실제 파일 저장
		}
		return "redirect:formUpload";
	}// end formUploadFile
	
	// 2. ajax 방식
	@GetMapping("upload")
	public void uploadPage() {} // end uploadPage
	
	// 핵심 처리
	@PostMapping("/uploadsAjax")
	@ResponseBody
	public List<String> uploadFile (@RequestPart MultipartFile[] uploadFiles) {
	    
		List<String> imageList = new ArrayList<>();
		
	    for(MultipartFile uploadFile : uploadFiles){
	    	// 업로드 된 파일이 이미지 파일이 아니면 멈추겠다.
	    	if(uploadFile.getContentType().startsWith("image") == false){ // 이미지가 아니면 일반파일로 보고 return null로 종료처리시킨다.
	    		System.err.println("this file is not image type");
	    		return null;
	        }
	  
	        String fileName = uploadFile.getOriginalFilename();
	        
	        System.out.println("fileName : " + fileName);
	    
	        // 이것이 포인트
	        //날짜 폴더 생성 // 사용자가 업로드한 파일이 오랫동안 사용하지 않으면 삭제를 한다. 
	        String folderPath = makeFolder();
	        //UUID > 식별자 128Bit : 절대로 중복되지 않은 식별값을 발행해준다.
	        String uuid = UUID.randomUUID().toString();
	        //저장할 파일 이름 중간에 "_"를 이용하여 구분
	        
	        String uploadFileName = folderPath +File.separator + uuid + "_" + fileName;
	        
	        String saveName = uploadPath + File.separator + uploadFileName;
	        
	        Path savePath = Paths.get(saveName);
	        //Paths.get() 메서드는 특정 경로의 파일 정보를 가져옵니다.(경로 정의하기)
	        System.out.println("path : " + saveName);
	        try{
	        	uploadFile.transferTo(savePath);
	            //uploadFile에 파일을 업로드 하는 메서드 transferTo(file)
	        } catch (IOException e) {
	             e.printStackTrace();	             
	        }
	        // DB에 해당 경로 저장
	        // 1) 사용자가 업로드할 때 사용한 파일명
	        // 2) 실제 서버에 업로드할 때 사용한 경로
	        imageList.add(setImagePath(uploadFileName));
	     }
	    
	    return imageList;
	}// end uploadFile
	
	// 파일을 날짜별로 관리하기 위해서 폴더별로 만들어서 처리한다.
	// 파일들은 한 폴더안에 다 집어넣지 않는다 > 관리하기 너무 어렵기 때문이다.
	private String makeFolder() {
		// LocalDate : format을 바로 사용할 수 있기 때문에 이걸 활용한다.
		String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")); // 날짜정보를 가져온다.
		// LocalDate를 문자열로 포멧
		String folderPath = str.replace("/", File.separator);
		File uploadPathFoler = new File(uploadPath, folderPath);
		// File newFile= new File(dir,"파일명");
		if (uploadPathFoler.exists() == false) { // 이클래스가 가지고 있는 정보를 기준으로 실제 폴더가 있는지 확인한다.
			uploadPathFoler.mkdirs(); // 해당경로를 기준으로 폴더를 생성한다.
			// 만약 uploadPathFolder가 존재하지않는다면 makeDirectory하라는 의미입니다.
			// mkdir(): 디렉토리에 상위 디렉토리가 존재하지 않을경우에는 생성이 불가능한 함수
			// mkdirs(): 디렉토리의 상위 디렉토리가 존재하지 않을 경우에는 상위 디렉토리까지 모두 생성하는 함수
		}
		return folderPath;
	} // end makeFolder
	
	private String setImagePath(String uploadFileName) {
		return uploadFileName.replace(File.separator, "/");
	}// end setImagePath
	
}// end class
