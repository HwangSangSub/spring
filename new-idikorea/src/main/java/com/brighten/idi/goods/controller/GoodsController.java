package com.brighten.idi.goods.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.goods.mapper.GoodsMapper;
import com.brighten.idi.goods.option.GoodsOptionDto;
import com.brighten.idi.goods.service.GoodsService;
import com.brighten.idi.util.BriException;
import com.brighten.idi.util.BriPage;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten") 
@RestController
@RequiredArgsConstructor
public class GoodsController {
   
	private final GoodsMapper goodsMapper; 
	
	private final GoodsService goodsService;
	
	private final Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

	@GetMapping("/api/v1/mngr/goods/popup")  
//	@PreAuthorize("hasRole('ADMIN')")     
	public List<GoodsDto> popupGoodsList(GoodsDto goodsDto) throws Exception{
		System.err.println("====================="); 
		System.err.println(goodsDto);  
		return goodsMapper.callOrderGoods(goodsDto);
	} 
	
	@GetMapping("/api/v1/mngr/goods")  
//	@PreAuthorize("hasRole('ADMIN')")     
	public BriPage<GoodsDto> goodsList(GoodsDto goodsDto) throws Exception{
		System.err.println("====================="); 
		System.err.println(goodsDto);  
		return new BriPage( goodsMapper.goodsList(goodsDto) ,goodsDto ,  goodsMapper.goodsListCnt(goodsDto));
	}  
	
	@GetMapping("/api/v1/mngr/goods/{goodsNo}/option/{optionNo}")  
//	@PreAuthorize("hasRole('ADMIN')")     
	public GoodsDto callOrderGoods(@PathVariable(name="goodsNo") Long goodsNo , @PathVariable(name="optionNo") Long optionNo) throws Exception{
		System.err.println("====================="); 
		GoodsDto dto=goodsMapper.goods(goodsNo);
		List<GoodsOptionDto> list = goodsService.goodsOptionList(goodsNo);
		
		for(GoodsOptionDto option : list) {
			System.err.println(option);
			System.err.println(option.getOpt2());
			System.err.println(optionNo);
			if(option.getOptionList()!=null && option.getOptionList().size()>0) {
				for(GoodsOptionDto innerOption : option.getOptionList()) {
					if(innerOption.getSno().equals(optionNo)) {
						System.err.println("333333333333");
						List<GoodsOptionDto> newList = new ArrayList<>();
						newList.add(innerOption);
						dto.setOptionList(newList);	
					}
				}
			}else if(option.getSno().equals(optionNo)) {
				List<GoodsOptionDto> newList = new ArrayList<>();
				newList.add(option);
				dto.setOptionList(newList);	
			}
//			
//			if(option.getOptionList()!=null && option.getOptionList().size()>0 && optionNo.equals(option.getSno()) ){
//				System.err.println("222222");
//				
//				
//				for(GoodsOptionDto innerOption : option.getOptionList()) {
//					if(innerOption.getSno().equals(option.getSno())) {
//						System.err.println("333333333333");
//						List<GoodsOptionDto> newList = new ArrayList<>();
//						newList.add(innerOption);
//						dto.setOptionList(newList);	
//					}
//				}
//			}else if(option.getOpt2()==null && optionNo.equals(option.getSno())){
//				List<GoodsOptionDto> newList = new ArrayList<>();
//				newList.add(option);
//				dto.setOptionList(newList);
//				System.err.println("1111111111111");
//			}
		}
		return dto;
	} 
	
	@PatchMapping(value="/api/v1/mngr/goods") 
	public boolean goodsUpdate(@RequestBody GoodsDto goodsDto) throws Exception{  
		System.err.println(goodsDto.getGoodsNo());  
		System.err.println(goodsDto.getColumn());
		System.err.println(goodsDto.isChecked()); 
		System.err.println("=====================");  
		return goodsMapper.goodsUpdate(goodsDto);  
	}  
	 
	@PostMapping(value="/api/v1/mngr/goods" ,consumes = MediaType.MULTIPART_FORM_DATA_VALUE )
	public boolean goodsInsert(@RequestPart(name="iconImage",required = false) MultipartFile iconImage ,
			@RequestPart(name="midiumImage",required = false) MultipartFile midiumImage,
			@RequestPart(name="contentImage",required = false) MultipartFile contentImage
			,@RequestParam(name="jsonData",required = true) String jsonData 
			) throws Exception {
		if(iconImage == null || midiumImage ==null || contentImage ==null)
			throw new BriException(HttpStatus.BAD_REQUEST , "첨부파일이 없습니다.");  
		ObjectMapper objectMapper = new ObjectMapper();
		GoodsDto goodsDto = objectMapper.readValue(jsonData, GoodsDto.class);  
		System.err.println(goodsDto);
		Set<ConstraintViolation<GoodsDto>> violations = validator.validate(goodsDto);
		if(!violations.isEmpty()){ 
			String errorField = "";
			for(ConstraintViolation<GoodsDto> valid : violations) {
				errorField += valid.getPropertyPath().toString();
			}
			throw new BriException(HttpStatus.BAD_REQUEST ,errorField+ "가 잘못됨" );
		}
		return goodsService.goodsInsert(iconImage, midiumImage, contentImage, goodsDto);
	}
    
	@PutMapping(value = "/api/v1/mngr/goods" ,consumes = MediaType.MULTIPART_FORM_DATA_VALUE )
	public boolean goodsUpdate(
			@RequestPart(name="iconImage",required = false) MultipartFile iconImage ,
			@RequestPart(name="midiumImage",required = false) MultipartFile midiumImage,
			@RequestPart(name="contentImage",required = false) MultipartFile contentImage 
			,@RequestParam(name="jsonData",required = true) String jsonData
			) throws Exception {   
			System.err.println("dsfhjkshfkjshd;gfjdshjkfjsdklfj");
			System.err.println(jsonData); 
			ObjectMapper objectMapper = new ObjectMapper(); 
			GoodsDto goodsDto = objectMapper.readValue(jsonData, GoodsDto.class); 
//			System.err.println(iconImage.getOriginalFilename());   
//			System.err.println(midiumImage.getOriginalFilename()); 
//			System.err.println(contentImage.getOriginalFilename()); 
//			System.err.println(goodsMultipartDto.getJsonData());
//			System.err.println(goodsMultipartDto.getMidiumImage()); 
//			System.err.println(goodsMultipartDto.getIconImage());
//			System.err.println(goodsMultipartDto.getContentImage());
			Set<ConstraintViolation<GoodsDto>> violations = validator.validate(goodsDto);
			if(!violations.isEmpty()){ 
				String errorField = ""; 
				for(ConstraintViolation<GoodsDto> valid : violations) {
					errorField += valid.getPropertyPath().toString();
				} 
				throw new BriException(HttpStatus.BAD_REQUEST ,errorField+ "가 잘못됨" );
			}
			System.err.println(goodsDto.getUseStock());
			System.err.println("???");
			
			return goodsService.goodsUpdate(iconImage, midiumImage, contentImage, goodsDto);
//			return true;
	}
	
	@DeleteMapping(value="/api/v1/mngr/goods/{goodsNo}")
	public boolean goodsDelete(@PathVariable(name="goodsNo") Long goodsNo) throws Exception{
		return goodsService.goodsDelete(goodsNo);
	}
	

	
} 
   