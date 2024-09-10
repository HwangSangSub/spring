package com.brighten.idi.order.controller;


import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.order.item.dto.OrderItemDto;
import com.brighten.idi.order.mapper.OrderMapper;
import com.brighten.idi.order.service.OrderService;
import com.brighten.idi.util.BriPage;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@RestController
@RequiredArgsConstructor
public class OrderController {

	private final OrderService orderService;
	
	private final OrderMapper orderMapper; 
	
	@GetMapping("/api/v1/mngr/order")
	public BriPage<OrderDto> member(OrderDto orderDto) throws Exception{
		System.err.println("111111111111");
		BriPage<OrderDto> page = orderService.orderList(orderDto);
		System.err.println(page);
		if(page.getContent().size()>0) {
			System.err.println(page.getContent().get(0).getCreateTime());
			System.err.println(page.getContent().get(0).getCreateTime().getClass());
		}
		return page; 
	}
	
	@GetMapping("/api/v1/mngr/order/status")
	public List<OrderDto> orderStatusCount(OrderDto orderDto) throws Exception{
		return orderMapper.orderStatusCount(orderDto);
	} 
	
	@DeleteMapping("/mngr/order/{orderNo}/cancel")
	public boolean orderCancel(@PathVariable(name="orderNo") Long orderNo ,@RequestBody OrderItemDto orderDto) throws Exception{
		System.err.println(orderDto);
		return orderService.orderItemCancel(orderDto);
	}
	
	@PostMapping(value="/api/v1/mngr/order" , consumes = MediaType.APPLICATION_JSON_VALUE)
	public boolean orderInsert(@RequestBody OrderDto dto) throws Exception{ 
		System.err.println(dto);
		return orderService.orderInsert(dto);
	} 
	
	@PostMapping(value="/api/v1/user/order" , consumes = MediaType.APPLICATION_JSON_VALUE)
	public Long userOrderInsert(@RequestBody OrderDto dto) throws Exception{
		System.err.println(dto);
		orderService.orderInsert(dto);
		return dto.getOrderNo();
	}
} 
   