package com.brighten.idi.info.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.goods.dto.CareLineDto;
import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.goods.dto.MainSlideDto;
import com.brighten.idi.goods.option.GoodsOptionDto;
import com.brighten.idi.info.dto.BankDto;

@Mapper
public interface InfoMapper {
	
	List<BankDto> bankList();
}
       