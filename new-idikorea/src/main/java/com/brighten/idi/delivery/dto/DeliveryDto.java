package com.brighten.idi.delivery.dto;

import java.time.LocalTime;

import com.brighten.idi.util.BriSearchDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class DeliveryDto {
	
	@Schema(description = "순번")
	Integer sno;
	
	@Schema(description = "배송명")
	String deliveryName;
	
	@Schema(description = "배송조건")
	Integer free;
	
	@Schema(description = "배송비타입")
	String deliveryType;
	
	@Schema(description = "배송비")
	Integer deliveryFee;
	
}
