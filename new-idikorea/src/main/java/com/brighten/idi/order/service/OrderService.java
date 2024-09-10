package com.brighten.idi.order.service;

import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.order.item.dto.OrderItemDto;
import com.brighten.idi.util.BriPage;

public interface OrderService {

	public BriPage<OrderDto> orderList(OrderDto dto) throws Exception; 
	
	public boolean orderItemCancel(OrderItemDto dto) throws Exception;
	
	public boolean orderInsert(OrderDto dto) throws Exception;
	
	public boolean updateOrder(OrderDto orderDto) throws Exception;
	
	public OrderDto order(Long orderNo) throws Exception;
}

  