package com.brighten.idi.util;

import org.springframework.util.StringUtils;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BriSearchDto extends BriPagingDto {

	@Schema(description = "검색 옵션", nullable = true, example = "없으면''")
	String searchOption;

	@Schema(description = "검색 값", nullable = true, example = " ")
	String searchValue;

	public boolean hasOptionAndValue() {	
		return StringUtils.hasText(searchOption) && StringUtils.hasText(searchValue); 
	}
}
