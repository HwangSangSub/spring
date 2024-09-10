package com.brighten.idi.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.order.item.dto.OrderItemDto;

@Mapper
public interface OrderMapper {
	
	public List<OrderDto> orderList(OrderDto dto); 
	
	public long orderListCnt(OrderDto dto); 
	
	public List<OrderDto> orderStatusCount(OrderDto dto); 
	
	public List<GoodsDto> orderItem(Long orderNo);
	
	public OrderDto order(Long orderNo);
	
	public boolean updateOrder(OrderDto orderDto);
	
	public boolean orderItemCancel(OrderItemDto dto);
	
	public boolean updateOrderItem(OrderItemDto dto);
	
	public boolean orderInsert(OrderDto dto);
	
} 
