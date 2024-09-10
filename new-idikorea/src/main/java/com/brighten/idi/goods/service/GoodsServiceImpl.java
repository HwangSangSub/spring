package com.brighten.idi.goods.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.brighten.idi.file.service.FileService;
import com.brighten.idi.goods.dto.CareLineDto;
import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.goods.dto.MainSlideDto;
import com.brighten.idi.goods.mapper.GoodsMapper;
import com.brighten.idi.goods.option.GoodsOptionDto;
import com.brighten.idi.util.BriException;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	
	private final GoodsMapper goodsMapper;
	
	private final FileService fileService;

	@Override
	@Transactional
	public boolean goodsInsert(MultipartFile iconImage, MultipartFile midiumImage, MultipartFile contentImage,
			GoodsDto goodsDto) throws Exception{

		Long iconImageId=null;
		Long midiumImageId=null; 
		Long contentImageId=null;
		if(iconImage!=null)
			iconImageId = fileService.register(iconImage, "/test/prod");
		if(midiumImage!=null)
			midiumImageId = fileService.register(midiumImage, "/test/prod");
		if(contentImage!=null)
			contentImageId = fileService.register(contentImage, "/test/prod"); 
		
		goodsDto.setIconImage(iconImageId);
		goodsDto.setMidiumImage(midiumImageId);
		goodsDto.setContentImage(contentImageId);
		boolean flag = goodsMapper.goodsInsert(goodsDto);
		
		int i = 1;
		
		for(GoodsOptionDto option : goodsDto.getOptionList()) {
			if(i==1)
				option.setSelectOption("Y");
			else
				option.setSelectOption("N");
			
			option.setGoodsNo(goodsDto.getGoodsNo()); 
			option.setGoodsName(goodsDto.getGoodsName());
			option.setEnabled("Y");
			flag=goodsMapper.goodsOptionInsert(option);
			i++;
		}
		
		
		return flag;
	}

	@Override
	@Transactional
	public boolean goodsUpdate(MultipartFile iconImage, MultipartFile midiumImage, MultipartFile contentImage,
			GoodsDto goodsDto) throws Exception {
		
		Long iconImageId=null;
		Long midiumImageId=null;
		Long contentImageId=null;
		GoodsDto originGoods = goodsMapper.goods(goodsDto.getGoodsNo());
		if(iconImage!=null) {
			if(originGoods.getIconImage()!=null && !fileService.remove(originGoods.getIconImage())) 
				throw new BriException(HttpStatus.NOT_FOUND , "icon이미지 경로가 잘못됨");
			
			iconImageId = fileService.register(iconImage, "/test/prod");
			goodsDto.setIconImage(iconImageId);
		}
		if(midiumImage!=null) {
			if(originGoods.getMidiumImage()!=null && !fileService.remove(originGoods.getMidiumImage())) 
				throw new BriException(HttpStatus.NOT_FOUND , "icon이미지 경로가 잘못됨");
			
			midiumImageId = fileService.register(midiumImage, "/test/prod");
			goodsDto.setMidiumImage(midiumImageId);
		}
		
		if(contentImage!=null) {
			if(originGoods.getContentImage()!=null && !fileService.remove(originGoods.getContentImage())) 
				throw new BriException(HttpStatus.NOT_FOUND , "icon이미지 경로가 잘못됨");
			
			contentImageId = fileService.register(contentImage, "/test/prod");
			goodsDto.setContentImage(contentImageId);
		}
		
		boolean flag = goodsMapper.goodsUpdate(goodsDto); 
		boolean optionFlag = false;
		goodsMapper.deleteOption(goodsDto.getGoodsNo());			
		for(int i = 0 ; i< goodsDto.getOptionList().size() ; i++ ) {
			GoodsOptionDto optionDto = goodsDto.getOptionList().get(i);
			optionDto.setGoodsNo(goodsDto.getGoodsNo());
			if(i==0)
				optionDto.setSelectOption("Y");
			else 
				optionDto.setSelectOption("N");
			
			optionDto.setGoodsName(goodsDto.getGoodsName());

			optionFlag =goodsMapper.goodsOptionInsert(optionDto);			
//			if(optionDto.getSno()!=null) {
//				optionFlag = goodsMapper.goodsOptionUpdate(optionDto); 	
//			}else {
//
//			}
		}
		
//		if(goodsDto.getDeleteOptionList().size()!=0) {
//			for(Map<String,Object> sno : goodsDto.getDeleteOptionList()) {
//				goodsMapper.deleteOption(sno);
//			}
//		}
			
		if(flag == false || optionFlag == false ) {
			String msg = "";
			if(flag == false)
				msg += "상품정보 ";
			if(optionFlag == false)
				msg += "옵션정보 ";
			msg += "가 잘못됨";	
			throw new BriException(HttpStatus.BAD_REQUEST, msg);
		}
				
		
		return flag;
	} 

	@Override
	public List<GoodsOptionDto> goodsOptionList(Long goodsNo) {
		GoodsOptionDto map = new GoodsOptionDto();
		map.setGoodsNo(goodsNo);
		map.setOpt("opt1");
		List<GoodsOptionDto> resultOptionList = new ArrayList();
 
		List<GoodsOptionDto> optList=goodsMapper.distinctOptionList(map); 

//		Integer sumCnt = 0; 
//		System.err.println(optList.size());
//		boolean flag = false;
//		for(GoodsOptionDto opt : optList) {
//			System.err.println("bbbb");
//			sumCnt += opt.getListCount(); 
//			if(opt.getOpt2() != null && !opt.getOpt2().equals(""))
//				flag = true;
//		}
//		System.err.println("=========================");
//		System.err.println(sumCnt);
//		System.err.println(optList.get(0).getListCount());
//		System.err.println("=========================");
//		if(sumCnt==optList.get(0).getListCount() && flag==false) {
//			System.err.println("ccc");
//			return optList;
//		}
		System.err.println("aaa");
		for(GoodsOptionDto opt : optList) {
			System.err.println("bbb");
			System.err.println(opt);
			System.err.println(opt.getOpt2()!=null && !opt.getOpt2().equals(""));
			if(opt.getOpt2()!=null && !opt.getOpt2().equals("")) {
				System.err.println("dddd");
				opt.setOpt("opt1");
				opt.setOpt2(null);
				opt.setOptionList( goodsMapper.repeatGoodsOptionList( opt ) );
			}
		}
			
			
		return optList;
	}

	@Override
	@Transactional
	public boolean goodsDelete(Long goodsNo) throws Exception {
		
		GoodsDto originGoods = goodsMapper.goods(goodsNo);
		if(originGoods.getIconImage()!=null && !fileService.remove(originGoods.getIconImage())) 
				throw new BriException(HttpStatus.NOT_FOUND , "icon이미지 경로가 잘못됨");
		if(originGoods.getMidiumImage()!=null && !fileService.remove(originGoods.getMidiumImage())) 
			throw new BriException(HttpStatus.NOT_FOUND , "icon이미지 경로가 잘못됨");
		if(originGoods.getContentImage()!=null && !fileService.remove(originGoods.getContentImage())) 
			throw new BriException(HttpStatus.NOT_FOUND , "icon이미지 경로가 잘못됨");
		boolean result = false;
		if(goodsMapper.deleteOption(goodsNo) && goodsMapper.deleteGoods(goodsNo) )
			return true;
		else
			throw new BriException(HttpStatus.BAD_REQUEST , "상품이 삭제되지 않음.");
	}

	@Override
	public List<MainSlideDto> mainImageSlide() throws Exception {
		return goodsMapper.mainImageSlide();
	}

	@Override
	public List<MainSlideDto> mainBestSeller() throws Exception {
		return goodsMapper.mainBestSeller();
	}

	@Override
	public List<CareLineDto> mainCareLine() throws Exception {
		return goodsMapper.mainCareLine();
	}

	@Override
	public GoodsDto goods(Long goodsNo) throws Exception {
		return goodsMapper.goods(goodsNo);
	}

	@Override
	public List<GoodsDto> goodsByOptionSno(List<GoodsDto> list) throws Exception {
		List<GoodsDto> goodsList = new ArrayList<>();
		for(GoodsDto dto : list) {
			goodsList.add( goodsMapper.goodsByOptionSno(dto) ) ;
		}
		return goodsList;
	}

	@Override
	public List<GoodsDto> goodsList(GoodsDto goodsDto) throws Exception {
		return goodsMapper.goodsList(goodsDto);
	}
	


 
}
