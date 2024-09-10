package com.brighten.idi.util;

import javax.validation.constraints.Min;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

@Schema(description = "페이징 정보")
@Getter
@Setter
public class BriPagingDto {

	@Schema(description = "검색 페이지 번호", example = "1" , hidden = true)
	@Min(1)
	int pageNum = 1;

	@Schema(hidden = true)
	int pageSize = 20;
 
	@Schema(hidden = true)
	int totalCount = 0;
	
	@Schema(hidden = true)
	private static String mobile;

	@Schema(description = "데이터 갯수" , hidden = true , example = "10")
	int itemSize = 20;
 
	@Schema(hidden = true)
	public int getOffset() { 
		return (pageNum-1) * itemSize;
	}

	@Schema(hidden = true)
	public int getLimit() {
		return itemSize;
	}
	
//	public int getItemId() {
//		return itemId;
//	}
	
	
}
