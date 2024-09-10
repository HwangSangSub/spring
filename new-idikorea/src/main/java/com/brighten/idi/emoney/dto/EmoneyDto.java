package com.brighten.idi.emoney.dto;

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
public class EmoneyDto extends BriSearchDto {
	
	@Schema(description = "적립금id")
	Integer emoneyId;
	
	@Schema(description = "회원번호")
	Integer memberNo;
	
	@Schema(description = "주문번호")
	Long orderNo;
	
	@Schema(description = "적립금")
	Integer emoney;
	
	@Schema(description = "합계판매금액")
	Integer sumPrice;
	
	@Schema(description = "내용")
	String memo;
	
	@Schema(description = "적립시간")
	LocalTime createTime;
	
}
