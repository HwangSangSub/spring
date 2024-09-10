package com.brighten.idi.brand.dto;

import com.brighten.idi.enumerate.YesNo;
import com.brighten.idi.util.BriSearchDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class BrandDto {
	
	@Schema(description = "브랜드번호")
	Integer brandNo;
	
	@Schema(description = "브랜드명")
	String brandName;
	
	
}
