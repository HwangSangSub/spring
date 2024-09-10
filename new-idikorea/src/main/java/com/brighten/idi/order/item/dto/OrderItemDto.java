package com.brighten.idi.order.item.dto;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotEmpty;

import com.brighten.idi.enumerate.OrderStatusType;
import com.brighten.idi.order.dto.OrderDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderItemDto extends OrderDto{
	
	@Schema(description = "아이템번호")
	Long itemNo;
	
	@NotEmpty
	@Schema(description = "")
	String goodsName; 
	
	@Schema(description = "상품번호")
	Long goodsNo;
	
	@Schema(description = "옵션번호")
	Long optionNo;
	
	@Schema(description = "옵션1") 
	String opt1;         
	
	@Schema(description = "옵션2") 
	String opt2;        
	
	@Schema(description = "가격")
	Integer price;
	
	@Schema(description = "공급가격")
	Integer supply;
	
	@Schema(description = "적립금")
	Integer reserve;
	
	@Schema(description = "쿠폰할인금액")
	Integer coupon;
	
	@Schema(description = "회원등급별 할인금액")
	Integer memberDc;
	
	@Schema(description = "수량")
	Integer ea;
	
	@Schema(description = "상태값")
	OrderStatusType itemStatus;
	
	@Schema(description = "??") 
	String stockable;
	
	@Schema(description = "환불사유")
	String refundReason; 
	 
	@Schema(description = "처리담당자")
	String adminName;
	
	@Schema(description = "")
	String memo;  
	 
	@Schema(description = "환불금액") 
	Integer refund;  
	
	@Schema(description = "환불적립금")
	Integer refundEmoney;  
	
	@Schema(description = "취소상품리스트")
	List<Long> deleteArr;
	
	@Schema(description = "취소시간")
	LocalDateTime cancelTime;
	
	@Schema(description = "취소번호")
	Long cancelNo;
	
}
