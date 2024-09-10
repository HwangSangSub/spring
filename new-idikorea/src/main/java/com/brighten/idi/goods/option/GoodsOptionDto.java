package com.brighten.idi.goods.option;

import java.util.List;

import javax.validation.constraints.Min;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class GoodsOptionDto{

	
	@Schema(description = "옵션번호")
	Long sno;
	
	@Schema(description = "상품번호")
	Long goodsNo;
	
	@Schema(description = "옵션1") 
	String opt1;
	
	@Schema(description = "옵션2")
	String opt2;
	
	@Schema(description = "판매가")
	Integer price;
	
	@Schema(description = "소비자가")
	@Min(value=1)
	Integer consumer;
	
	@Schema(description = "공급가") 
	Integer supply;
	
	@Schema(description = "상품별적립금")
	Integer reserve;
	
	@Schema(description = "수량") 
	Integer stock;
	
	@Schema(description = "옵션1 이미지")
	String opt1img;
	
	@Schema(description = "옵션1 아이콘")
	String opt1icon;
	
	@Schema(description = "옵션2 아이콘")
	String opt2icon;
	
	@Schema(description = "옵션번호")
	String optno;
	
	@Schema(description = "사용여부")
	String enabled;
	
	@Schema(description = "상품명")
	String goodsName;

	@Schema(description = "1번옵션")
	String selectOption;

	@Schema(description = "조회할opt")
	String opt;

	Integer listCount;
	
	@Schema(description = "하위옵션")
	List<GoodsOptionDto> optionList;
 	
}
