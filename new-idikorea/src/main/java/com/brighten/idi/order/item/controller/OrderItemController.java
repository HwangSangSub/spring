package com.brighten.idi.order.item.controller;


import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.order.item.dto.OrderItemDto;
import com.brighten.idi.order.item.service.OrderItemService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@RestController
@RequiredArgsConstructor
public class OrderItemController {

	private final OrderItemService orderItemService;
	
	@GetMapping("/api/v1/mngr/order/{orderNo}/item")
	public List<OrderItemDto> member(@PathVariable(value="orderNo") Long orderNo,OrderItemDto orderItemDto) throws Exception{
		return orderItemService.orderItemList(orderItemDto);
	}
	
	
    
    
} 
   