package com.brighten.idi.order.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.order.cart.mapper.CartMapper;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@Tag(name = "멤버")
@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {
	
	private final CartMapper cartMapper;

	@Override
	public boolean insertCart(GoodsDto dto) throws Exception {
		return cartMapper.insertCart(dto);
	}

	@Override
	public List<GoodsDto> cartList(GoodsDto dto) throws Exception {
		return cartMapper.cartList(dto);
	}	

}
