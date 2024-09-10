package com.brighten.idi.goods.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.goods.dto.CareLineDto;
import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.goods.dto.MainSlideDto;
import com.brighten.idi.goods.option.GoodsOptionDto;

@Mapper
public interface GoodsMapper {
	
	List<GoodsDto> goodsList(GoodsDto goodsDto);
	
	int goodsListCnt(GoodsDto goodsDto);
	
	GoodsDto goodsByOptionSno(GoodsDto dto);
	
	GoodsDto goods (Long goodsNo);
	
	boolean goodsInsert(GoodsDto goodsDto);
	
	boolean goodsOptionInsert(GoodsOptionDto goodsOptionDto);
	
	boolean goodsOptionUpdate(GoodsOptionDto goodsOptionDto);
	
	boolean goodsUpdate(GoodsDto goodsDto);
	
	List<String> makerList (String value);
	
	List<GoodsOptionDto> distinctOptionList(GoodsOptionDto goodsOptionDto);
	
	List<GoodsOptionDto> repeatGoodsOptionList(GoodsOptionDto goodsOptionDto);
	
	boolean deleteOption (Long goodsNo);
	
	boolean deleteGoods (Long goodsNo);

	GoodsOptionDto selectOption (Long sno);
	
	List<GoodsDto> callOrderGoods(GoodsDto goodsDto);
	
	List<MainSlideDto> mainImageSlide();
	
	List<MainSlideDto> mainBestSeller();
	
	List<CareLineDto> mainCareLine();
}
       