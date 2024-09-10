package com.brighten.idi.util;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

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
public class BriSearchDateDto extends BriSearchDto {

	@Schema(description = "날짜검색 옵션" , hidden = true)
	String searchDateOption;

	@Schema(description = "시작일", example = "2021-01-01", hidden = true)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	LocalDate startTime;

	@Schema(description = "종료일", example = "2051-01-01", hidden = true)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	LocalDate endTime;
	
	@Schema(description = "검색일 (년,월 만 정확히 입력)", example = "2023-08-01")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	LocalDate searchDate;

	public boolean hasDateOption() { return StringUtils.hasText(searchDateOption); }
	public boolean hasStDate() { return startTime != null; }
	public boolean hasEdDate() { return endTime != null; }

}
