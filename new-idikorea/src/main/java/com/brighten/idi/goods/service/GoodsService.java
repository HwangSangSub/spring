package com.brighten.idi.goods.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.brighten.idi.goods.dto.CareLineDto;
import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.goods.dto.MainSlideDto;
import com.brighten.idi.goods.option.GoodsOptionDto;

public interface GoodsService {
	
	public boolean goodsInsert(MultipartFile iconImage , MultipartFile midiumImage , MultipartFile contentImage , GoodsDto goodsDto) throws Exception;
	
	public boolean goodsUpdate(MultipartFile iconImage , MultipartFile midiumImage , MultipartFile contentImage , GoodsDto goodsDto) throws Exception;

	List<GoodsDto> goodsByOptionSno(List<GoodsDto> list) throws Exception;
	
	public List<GoodsOptionDto> goodsOptionList(Long goodsNo);
	
	public boolean goodsDelete(Long goodsNo) throws Exception;

	public List<MainSlideDto> mainImageSlide() throws Exception;
	
	public List<MainSlideDto> mainBestSeller() throws Exception;
	
	public List<CareLineDto> mainCareLine() throws Exception;
	
	public GoodsDto goods(Long goodsNo) throws Exception;
	
	public List<GoodsDto> goodsList(GoodsDto goodsDto) throws Exception;
}

  