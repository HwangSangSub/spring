package com.brighten.idi.category.dto;

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
public class CategoryDto {
	
	@Schema(description = "카테고리번호")
	Integer categoryNo;
	
	@Schema(description = "카테고리이름")
	String categoryName;
	
	@Schema(description = "카테고리이름2")
	String categoryName2;
	
	@Schema(description = "카테고리코드")
	String categoryCode;
	
	@Schema(description = "후원할인여부")
	YesNo memberDc;
	
	@Schema(description = "순서")
	Integer sort; 
	
	@Schema(description = "숨김여부")
	YesNo hidden;
	
	@Schema(description = "하위상품여부 플래그")
	String flag;
	
	@Schema(description = "")
	Integer level;
	
	@Schema(description = "")
	String openmarketCategory;
	
	@Schema(description = "이미지사용여부?")
	String useImage;
	
	@Schema(description = "")
	String openmarket;
	
	@Schema(description = "모바일에보일지?")
	Integer hiddenMobile;
	
	@Schema(description = "기본이미지id")
	Long basicImageId;
	
	@Schema(description = "마우스오버시이미지id")
	Long mouseImageId;
	
	void setHidden(int hidden) {
		this.hidden = hidden==1? YesNo.Y : YesNo.N;
	}
	
	Integer getHidden(YesNo hidden) {
		return hidden.equals(YesNo.Y)? 1 : 0;
	}

}
