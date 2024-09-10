package com.brighten.idi.file.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.file.dto.FileDto;

@Mapper
public interface FileMapper {
	
	boolean register(FileDto fileDto);
	
	FileDto get(Long fileId);

	boolean remove(Long fileId);
}
 