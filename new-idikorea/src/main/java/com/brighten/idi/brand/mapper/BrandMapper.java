package com.brighten.idi.brand.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.brand.dto.BrandDto;

@Mapper
public interface BrandMapper {
	
	public List<BrandDto> brand();
	
}
