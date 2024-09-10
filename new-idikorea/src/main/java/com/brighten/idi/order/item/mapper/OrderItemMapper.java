package com.brighten.idi.order.item.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.order.item.dto.OrderItemDto;

@Mapper
public interface OrderItemMapper { 
	
	public List<OrderItemDto> orderItemList(OrderItemDto orderItemDto);
	
	public boolean orderItemInsert(OrderItemDto dto);
}
