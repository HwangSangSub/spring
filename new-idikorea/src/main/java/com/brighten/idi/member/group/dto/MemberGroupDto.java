package com.brighten.idi.member.group.dto;

import java.time.LocalDateTime;

import com.brighten.idi.enumerate.YesNo;
import com.brighten.idi.util.BriSearchDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberGroupDto extends BriSearchDto{
	
	@Schema(description = "레벨")
	Integer level;
	
	@Schema(description = "그룹이름")
	String groupName;
	
	@Schema(description = "할인율")
	Integer dc;
	
	@Schema(description = "추가적립금")
	Integer addEmoney;
	
	@Schema(description = "배송비무료여부")
	@Builder.Default
	YesNo freeDelivery=YesNo.N;
	
	@Schema(description = "할인적용카테고리")
	String excate;
	
	@Schema(description = "할인적용상품") 
	String excep;
	
	@Schema(description = "생성일")
	LocalDateTime createTime;
	
	@Schema(description = "수정일")
	LocalDateTime updateTime;
	
	
}
