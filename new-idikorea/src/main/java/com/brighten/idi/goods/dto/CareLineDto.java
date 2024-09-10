package com.brighten.idi.goods.dto;

import java.util.List;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CareLineDto {

	@Schema(description = "순분")
	Integer sno;
	
	@Schema(description = "카테고리번호")
	Integer categoryNo;
	
	@Schema(description = "카테고리 설명 이미지 파일id")
	Integer fileId;
	
	@Schema(description = "제목")
	String title;
	
	@Schema(description = "내용")
	String content;
	
	@Schema(description = "경로")
	String dir;  
	
	@Schema(description = "파일id")
	Long iconImageId;  

	@Schema(description = "상품리스트")
	List<GoodsDto> goodsList ;  	 
//	@Schema(description = "작성일")
//	LocalDateTime createTime;	
} 
