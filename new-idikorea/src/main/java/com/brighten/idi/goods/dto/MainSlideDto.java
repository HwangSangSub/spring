package com.brighten.idi.goods.dto;

import java.time.LocalDateTime;

import com.brighten.idi.enumerate.YesNo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MainSlideDto {
	
	@Schema(description = "순번")
	Integer sno;  
	
	@Schema(description = "파일id")
	Long imageFileId;

	@Schema(description = "링크주소") 
	String link;
	
	@Schema(description = "순서")
	Integer sort;
 
	@Schema(description = "짧은내요ㅕㅇ")
	String shortContent;

	@Schema(description = "상품명")
	String goodsName;

	@Schema(description = "판매가")
	String price;

	@Schema(description = "소비자가")
	String consumer;
	
	@Schema(description = "상품번호")
	Long goodsNo;
	
	@Schema(description = "사용여부")
	YesNo enabled;
	
//	@Schema(description = "작성일")
//	LocalDateTime createTime;	
}
