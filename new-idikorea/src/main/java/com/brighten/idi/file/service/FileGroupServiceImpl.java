package com.brighten.idi.file.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

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
public class FileGroupServiceImpl implements FileGroupService {
	
	@Override
	public Long create() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long register(List<MultipartFile> files, Long groupId, String dir) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FileDto> gets(Long fileGroupId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Long fileGroupId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	



}
