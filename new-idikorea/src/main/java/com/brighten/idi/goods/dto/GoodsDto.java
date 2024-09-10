package com.brighten.idi.goods.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.brighten.idi.brand.dto.BrandDto;
import com.brighten.idi.goods.option.GoodsOptionDto;
import com.brighten.idi.order.item.dto.OrderItemDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
//@Builder
public class GoodsDto extends OrderItemDto{
	 
	@Schema(description = "")
	String goodsCode;  
	
	@Schema(description = "") 
	Long sno; 
	  
	@Schema(description = "") 
	String countryOrigin; 
	
	@Schema(description = "")  
	String cartType;  
	  
	@Schema(description = "") 
	String maker;  
	
	@Schema(description = "")
	Integer brandNo; 
	
	@NotNull
	@Min(value = 0)  
	@Max(value = 1)
	@Schema(description = "") 
	Integer tax; 
	
//	@Schema(description = "")
//	Integer deliveryType;  
	
	@Schema(description = "") 
	String keyword; 
	
	@Schema(description = "") 
	String shortContent;  
	
	@Schema(description = "")
	String longContent; 
	  
	@Schema(description = "")  
	Long iconImage;   
	
	@Schema(description = "아이콘이미지이름")  
	String iconImageName;   
	
	@Schema(description = "")
	Long smallImage; 
	
	@Schema(description = "아이콘이미지이름")
	String smallImageName; 
	
	@Schema(description = "")
	Long midiumImage; 
	
	@Schema(description = "아이콘이미지이름")
	String midiumImageName; 
	 
	@Schema(description = "")
	Long largeImage; 
	
	@Schema(description = "아이콘이미지이름") 
	String largeImageName;  
	
	@Schema(description = "")
	Long mobileImage; 
	
	@Schema(description = "아이콘이미지이름") 
	String mobileImageName; 
	 
	@Schema(description = "")  
	Long contentImage; 
	
	@Schema(description = "아이콘이미지이름") 
	String contentImageName; 
	
	@Schema(description = "") 
	LocalDateTime createTime; 
	
	@Schema(description = "")
	String[] icon; 
	
	@Schema(description = "")
	String[] searchDateArr; 
	
	@Schema(description = "")
	String stringIcon; 
	
	@Schema(description = "")
	String column; 
	
	@Schema(description = "")
	boolean checked;  
	
	@Schema(description = "")
	Integer userOpen;  
	
	@Schema(description = "")
	Integer callOpen;  
	
	@Schema(description = "")
	Integer soldOut; 
	
	@Schema(description = "")
	Integer regularOpen; 
	
	@Schema(description = "")
	String ex1; 
	
	@Schema(description = "")
	String ex2; 
	
	@Schema(description = "")
	String ex3; 
	
	@Schema(description = "")
	String ex4; 
	
	@Schema(description = "")
	String ex5; 
	
	@Schema(description = "")
	String ex6; 
	
	@Schema(description = "관리메모")
	String memo; 
	
	@Schema(description = "")
	String useStock;  
	
	@Schema(description = "") 
	Integer nowStock; 
	
	@Schema(description = "")
	Integer goodsDelivery;  
	
	@Schema(description = "")
	String useEmoney; 
	
	@Schema(description = "")
	Integer minEa; 
	
	@Schema(description = "")
	Integer maxEa;  
	
	@Schema(description = "")  
	LocalDateTime updateTime; 
	   
	@Schema(description = "") 
	Integer openMobile; 
	 
	@Schema(description = "") 
	String detailView;   
	
	@Schema(description = "") 
	String category;   
	 
	@Schema(description = "")   
	LocalDate receivingTime;     
	 
	@Schema(description = "") 
	String useRegular;      
	  
	@Schema(description = "") 
	String country;  
	    
	@Schema(description = "") 
	String searchMaker;        
	  
	@Schema(description = "")  
	String searchBrand;         
	
	@Schema(description = "정가") 
	Integer consumer;          
	
	@Schema(description = "상품별적립금") 
	Integer reserve;          
	
	@Schema(description = "판매가") 
	Integer price;           
	
	@Schema(description = "공급가") 
	Integer supply;         
	
	@Schema(description = "숨김여부 1 이면 관리자 상품목록에만 보임") 
	Integer hidden;         
	 
	@Schema(description = "") 
	List<GoodsOptionDto> optionList;    
	
	@Schema(description = "")  
	List<String> makerList; 
	
//	@Schema(description = "")  
//	List<Integer> searchPrice; 
	 
	@Schema(description = "")   
	List<String> countryList; 
	 
	@Schema(description = "")  
	List<BrandDto> brandList;  
	
	@Schema(description = "브랜드이름") 
	String brandName;  
	
	LocalDate startDateTime;
	
	LocalDate endDateTime;
	
	Integer[] searchPrice; 
	
	List<Map<String,Object>> deleteOptionList;
	
	String uuid; 
	
	Integer minPrice;
	
	Integer maxPrice;
	  
	Integer saveEmoneyPercent;
	  
	public void setIcon(String icon) {
		this.icon= icon.split("");
		this.stringIcon = icon;
	}
	
	public void setTax(String tax) {
		this.tax = Integer.parseInt(tax);
	}
	
	public void setBrandNo(Integer brandNo) {
		this.brandNo = (brandNo == null || brandNo.equals(""))? 0 :  brandNo;
	}
 	
//	public void setCallOpen(String callOpen) {
//		this.callOpen = (callOpen == null || callOpen.equals("") ) ? 0 :  Integer.parseInt( callOpen );
//	}
//	
//	public void setUserOpen(String userOpen) {
//		this.userOpen = ( !userOpen.equals("0") && !userOpen.equals("1")) ? null : Integer.parseInt(userOpen) ;
//	}
//	
	public void setSoldOut(String soldOut) {
		this.soldOut = ( !soldOut.equals("0") && !soldOut.equals("1") && !soldOut.equals("99")) ? null : Integer.parseInt(soldOut) ;
	}

	public void setUseRegular(String regularOpen) {
		if(regularOpen.equals("Y")||regularOpen.equals("N")) {
			this.useRegular = regularOpen;
		}else {
			this.useRegular = ( !regularOpen.equals("0") && !regularOpen.equals("1")) ? null : regularOpen.equals("0")? "N" : "Y" ;
		}
	}	

	public Integer getHidden() {
		if(this.callOpen != null && this.userOpen != null && this.callOpen == 0 && this.userOpen == 0 )
			return 1;
		else
			return 0; 
	} 
	 	
	public void setSearchDateArr(String[] searchDateArr) {
		this.searchDateArr = searchDateArr;
		try {
        	if(this.getSearchDateArr()!=null	 && this.getSearchDateArr().length>0) {
        		String dateString = this.getSearchDateArr()[0];  // 예제 날짜 문자열 
        		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
        		this.startDateTime = LocalDate.parse(dateString, formatter);
        	}
        } catch (DateTimeParseException e) {
        	this.startDateTime = null;	
        } 
        try {
        	if(this.getSearchDateArr()!=null && this.getSearchDateArr().length>1) {
        		String dateString = this.getSearchDateArr()[1];  // 예제 날짜 문자열  
        		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        		this.endDateTime = LocalDate.parse(dateString, formatter);
        	}
        } catch (DateTimeParseException e) {
        	this.endDateTime = null;
        } 
		
	}
	
	public void setSearchPrice(Integer[] price) {
		this.searchPrice = price;
		if(this.getSearchPrice()!=null && this.getSearchPrice().length>0) {
			this.minPrice = this.getSearchPrice()[0];
		}
		if(this.getSearchPrice()!=null && this.getSearchPrice().length>1) {
			this.maxPrice = this.getSearchPrice()[1];
		}
		
	}
	
	
}
