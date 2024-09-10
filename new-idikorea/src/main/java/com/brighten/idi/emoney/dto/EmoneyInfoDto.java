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
public class EmoneyInfoDto extends BriSearchDto {
	
	@Schema(description = "작성시간")
	LocalTime createTime;
	
	@Schema(description = "적립퍼센트")
	Integer saveEmoneyPercent;
	
	@Schema(description = "cut 1의자리에서 버림")
	Integer cut;
	
	@Schema(description = "최소사용금액")
	Integer minUsedEmoney;
	
	@Schema(description = "최대사용금액")
	Integer maxUsedEmoney;
}
