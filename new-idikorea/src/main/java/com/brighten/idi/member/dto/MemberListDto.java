package com.brighten.idi.member.dto;

import java.util.List;

import com.brighten.idi.emoney.dto.EmoneyDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class MemberListDto {
	
	@Schema(description = "적립금 리스트")
	List<EmoneyDto> emoneyList;
	
	@Schema(description = "회원정보")
	MemberDto member;
	

	
}
