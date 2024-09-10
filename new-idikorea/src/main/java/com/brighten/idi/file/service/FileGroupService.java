package com.brighten.idi.file.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.brighten.idi.file.dto.FileDto;


public interface FileGroupService {

	
	public Long create() throws Exception;

	public Long register(List<MultipartFile> files, Long groupId, String dir) throws Exception;

	public List<FileDto> gets(Long fileGroupId) throws Exception;
	
	public boolean remove(Long fileGroupId) throws Exception;
}
