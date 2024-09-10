package com.brighten.idi.order.cart.service;

import java.util.List;

import com.brighten.idi.goods.dto.GoodsDto;

public interface CartService {

	public boolean insertCart(GoodsDto dto) throws Exception;
	
	public List<GoodsDto> cartList(GoodsDto dto) throws Exception;
}

  