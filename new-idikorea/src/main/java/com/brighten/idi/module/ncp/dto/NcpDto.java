package com.brighten.idi.module.ncp.dto;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import com.brighten.idi.enumerate.BirthType;
import com.brighten.idi.enumerate.GenderType;
import com.brighten.idi.enumerate.YesNo;
import com.brighten.idi.member.group.dto.MemberGroupDto;
import com.brighten.idi.util.BriSearchDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class NcpDto extends BriSearchDto{
	
	@Schema(description = "api주소")
	String url;
	
	@Schema(description = "secretKey")
	String skKey;
	
	@Schema(description = "보내는시간")
	String timestamp;
	
	@Schema(description = "accessKey")
	String accessKey;
	
	@Schema(description = "메서드 get, post")
	String method;
	
	@Schema(description = "바디데이타")
	String inputData;//map.put("inputData" , "{\"amount\":"+amount+",\"orderId\":"+orderId+"}");
	
	@Schema(description = "ncp 시그니쳐키")
	String signature;
}
