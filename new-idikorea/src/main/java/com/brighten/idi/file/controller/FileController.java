package com.brighten.idi.file.controller;


import java.net.URI;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.brighten.idi.file.dto.FileDto;
import com.brighten.idi.file.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@RestController
@RequiredArgsConstructor
public class FileController {

	private final FileService fileService;

	@Value("${auth.upload}")
	String propertyPath;
	
	@Value("${auth.file-server-url}")
	String fileServer;
	
	private final RestTemplate restTemplate;


	
	@GetMapping("/api/v1/file/{id}")
//	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<ByteArrayResource> file(@PathVariable(name="id") Long id) throws Exception{
//        String directoryPath = "propertyPath";
//        // File 객체를 생성합니다.
//        File directory = new File(directoryPath);
		FileDto fileDto= fileService.get(id);
//        System.err.println(fileDto.getId());
//        Path filePath = Paths.get("https://"+fileServer+fileDto.getDir(), fileDto.getName());
//
//        // 이미지 파일을 바이트 배열로 읽기
//        byte[] imageBytes = Files.readAllBytes(filePath);
//
//        // 확장자를 기반으로 MIME 타입 설정
//        String mimeType = Files.probeContentType(filePath);
//        MediaType mediaType = MediaType.parseMediaType(mimeType);
//
//        // HTTP 헤더 설정
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(mediaType);

        // ResponseEntity로 이미지 데이터 반환
//        return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
        String fileName = "example.png"; // 데이터베이스에서 가져온 파일 이름
        String fileDir = "/path/to/images"; // 데이터베이스에서 가져온 디렉토리 경로

        String externalUrl = "https://" + fileServer + fileDto.getDir() + "/" + fileDto.getName();
        System.err.println("mmmm");
		System.err.println(externalUrl);
        try {
            // 외부 서버에서 이미지를 가져오기
            ResponseEntity<byte[]> response = restTemplate.exchange(new URI(externalUrl), HttpMethod.GET, null, byte[].class);
            byte[] imageBytes = response.getBody();

            if (imageBytes != null) {
                // Content-Type 설정
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.IMAGE_PNG); // 적절한 MIME 타입 설정

                ByteArrayResource resource = new ByteArrayResource(imageBytes);
                return ResponseEntity.ok()
                        .headers(headers)
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
	} 
	

    
    
} 
   