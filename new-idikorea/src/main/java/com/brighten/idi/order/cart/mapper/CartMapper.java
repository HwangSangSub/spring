package com.brighten.idi.order.cart.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.goods.dto.GoodsDto;

@Mapper
public interface CartMapper {
	
	public boolean insertCart(GoodsDto dto);
	
	public List<GoodsDto> cartList(GoodsDto dto);
} 
