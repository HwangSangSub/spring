package com.brighten.idi.order.item.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.brighten.idi.order.item.dto.OrderItemDto;
import com.brighten.idi.order.item.mapper.OrderItemMapper;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@Tag(name = "주문상품")
@Service
@RequiredArgsConstructor
public class OrderItemServiceImpl implements OrderItemService {
	
	private final OrderItemMapper orderItemMapper;

	@Override
	public List<OrderItemDto> orderItemList(OrderItemDto orderItemDto) throws Exception {
		return orderItemMapper.orderItemList(orderItemDto);
	}




}
