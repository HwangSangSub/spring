package com.brighten.idi.delivery.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.delivery.dto.DeliveryDto;

@Mapper
public interface DeliveryMapper {
	
	public DeliveryDto deliveryInfo();
}
