package com.brighten.idi.file.service;

import org.springframework.web.multipart.MultipartFile;

import com.brighten.idi.file.dto.FileDto;


public interface FileService {

	//파일 1건 등록
	public Long register(MultipartFile file, String dir) throws Exception;

	//파일 1건 등록
	public Long register(MultipartFile file, String dir, Integer i, Long groupId) throws Exception;

	public FileDto get(Long id) throws Exception;

	//파일 1건 삭제
	public boolean remove(Long fildId) throws Exception;
	
}
