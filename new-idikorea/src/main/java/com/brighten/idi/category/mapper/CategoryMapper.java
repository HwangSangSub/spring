package com.brighten.idi.category.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.category.dto.CategoryDto;

@Mapper
public interface CategoryMapper {
	
	List<CategoryDto> category(String user);
	
} 
