package com.brighten.idi.order.service;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brighten.idi.delivery.mapper.DeliveryMapper;
import com.brighten.idi.emoney.dto.EmoneyDto;
import com.brighten.idi.emoney.mapper.EmoneyMapper;
import com.brighten.idi.enumerate.OrderStatusType;
import com.brighten.idi.enumerate.OrderType;
import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.goods.mapper.GoodsMapper;
import com.brighten.idi.goods.option.GoodsOptionDto;
import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.mapper.MemberMapper;
import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.order.item.dto.OrderItemDto;
import com.brighten.idi.order.item.mapper.OrderItemMapper;
import com.brighten.idi.order.mapper.OrderMapper;
import com.brighten.idi.util.BriException;
import com.brighten.idi.util.BriPage;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@Tag(name = "멤버")
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private final OrderMapper orderMapper;	
	
	private final OrderItemMapper orderItemMapper;
	 
	private final MemberMapper memberMapper; 
	
	private final EmoneyMapper emoneyMapper; 
	
	private final GoodsMapper goodsMapper; 

	private final DeliveryMapper deliveryMapper;
	
	@Override
	public BriPage<OrderDto> orderList(OrderDto dto) throws Exception {
		Long cnt=orderMapper.orderListCnt(dto) ; 
		System.err.println("22222222222222");
		BriPage<OrderDto> page = new BriPage<OrderDto>(orderMapper.orderList(dto), dto, cnt==null? 0 : cnt) ;
		
		return page;
	}
   
	@Override
	@Transactional
	public boolean orderItemCancel(OrderItemDto dto) throws Exception {
		orderMapper.orderItemCancel(dto);   

		//전체주문이 취소된건지 확인하기위해 리스트 불러옴1
		List<GoodsDto> list = orderMapper.orderItem(dto.getOrderNo());
		
		//주문번호로 회원번호 찾아오기
		Integer memberNo = orderMapper.order(dto.getOrderNo()).getMemberNo();
		Integer cancelRefundPrice = 0; 
		//각아이템의 주문상태값 변경
		for(Long cancelItem : dto.getDeleteArr()) {
			dto.setItemNo(cancelItem);
			dto.setItemStatus(OrderStatusType.주문취소); 
			orderMapper.updateOrderItem(dto);
			for(GoodsDto goodsDto : list) { 
				if(cancelItem.equals(goodsDto.getItemNo())) {
					//취소 되는 상품금액의 합계
					cancelRefundPrice += (goodsDto.getPrice()*goodsDto.getEa());
				}
			}
		}
		//이머니 환불이 있을경우 회원의 적립금 추가해주기
		if(dto.getRefundEmoney()!=0) {
			EmoneyDto emoneyDto = new EmoneyDto(); 
			emoneyDto.setEmoney(dto.getRefundEmoney());
			emoneyDto.setMemberNo(memberNo);
			emoneyDto.setOrderNo(dto.getOrderNo());
			emoneyDto.setMemo(dto.getOrderNo()+" 주문 취소건으로 인한 마일리지 환불.");
			emoneyMapper.insertEmoney(emoneyDto);
		}
		//적립되었던 emoney 다시 회수 -> 상품판매금액합계 넣은뒤에 db에 저장된 적립% 적용해서 음수값으로 insert
		EmoneyDto emoneyDto = new EmoneyDto();
		emoneyDto.setSumPrice(cancelRefundPrice);
		emoneyDto.setMemberNo(memberNo);
		emoneyDto.setOrderNo(dto.getOrderNo());
		emoneyDto.setMemo(dto.getOrderNo()+" 주문 취소건으로 인한 접립 마일리지 회수.");
		emoneyMapper.insertEmoney(emoneyDto);
		
		//전체주문이 취소된건지 확인하기위해 리스트 불러옴2
		int cancelCount=0;
		for(GoodsDto goodsDto : list){
			if(goodsDto.getItemStatus().equals("주문취소"))
				cancelCount++;
		}
		
		
		
		//아이템의 사이즈와 , 주문취소의 사이즈가 같아질경우 주문상태도 취소로 바꿔줘야함
		if(list.size()==cancelCount) {
			OrderDto orderDto = new OrderDto();
			orderDto.setStatus(OrderStatusType.주문취소);
			orderDto.setOrderNo(dto.getOrderNo());
			orderMapper.updateOrder(orderDto);
		}
		System.err.println("===========");
		System.err.println("결제취소넣을자리");
		System.err.println("==========="); 
		System.err.println("===========");
		System.err.println("취소알림톡넣을자리");
		System.err.println("===========");
		return true; 
	}

	@Override
	@Transactional
	public boolean orderInsert(OrderDto dto) throws Exception {
		
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberNo(dto.getMemberNo());
		Integer couPonPercent = dto.getCoupon();
		
		memberDto=memberMapper.member(memberDto);
		Integer sumPrice = 0;
		Integer sumMemberDc = 0;
		Integer originPrice = 0; 
		Integer couponDc = 0; 
		Integer deliveryFree = 0 ;
		
		for(GoodsDto goodsDto : dto.getOrderItemList()) {
			GoodsOptionDto checkGoodsDto = goodsMapper.selectOption(goodsDto.getSno());
			Integer price =(int) Math.floor( checkGoodsDto.getPrice()* ( (100- (memberDto.getDc()*1.0 ) )/100 )*goodsDto.getEa() ) ; //회원 할인적용한 판매가
			System.err.println( price );
			Integer memberDc =(int) Math.ceil( checkGoodsDto.getPrice()* ( (memberDto.getDc()*1.0 ) /100 )*goodsDto.getEa() ) ; //회원 할인금액
			System.err.println(price);
			System.err.println(memberDc);
			System.err.println("가격"+checkGoodsDto.getPrice()); 
			originPrice += checkGoodsDto.getPrice()*goodsDto.getEa() ;
			sumPrice += price;
			sumMemberDc += memberDc;
		} 
		
		if(dto.getCoupon()==10) {
			System.err.println(dto.getCoupon());
			System.err.println(((100-dto.getCoupon())/100.0));
			System.err.println(originPrice);
			couponDc = (int) (originPrice*((dto.getCoupon())/100.0));
		} 
		System.err.println("===================");
		System.err.println((sumPrice - dto.getEmoney() - dto.getUnpaid() - dto.getEnuri() - couponDc ));
		deliveryFree = (sumPrice - dto.getEmoney() - dto.getUnpaid() - dto.getEnuri() - couponDc ) < 30000 ? 3000 : 0 ;
		
		dto.setDeliveryPrice(deliveryFree);
		System.err.println( sumPrice - dto.getEmoney() - dto.getUnpaid() - dto.getEnuri() - couponDc + deliveryFree );
		System.err.println( (dto.getOrderPrice()-dto.getUnpaid()) );
		if( !( (sumPrice - dto.getEmoney() - dto.getUnpaid() - dto.getEnuri() - couponDc + deliveryFree) == (dto.getOrderPrice()-dto.getUnpaid()) ) )  //db에서 계산한 가격과 앞에서 넘어온 가격 비교후 틀리면 exception
			throw new BriException(HttpStatus.BAD_REQUEST, "결제금액이 "+ (sumPrice - dto.getEmoney() - dto.getUnpaid() - dto.getEnuri() - couponDc ) + "원이어야 합니다.");
		else
			System.err.println("price check success");
		

		dto.setOriginPrice(originPrice-dto.getUnpaid());
		dto.setOrderPrice((sumPrice - dto.getEmoney() - dto.getUnpaid() - dto.getEnuri() - couponDc ));
		dto.setMemberDc(sumMemberDc);
		dto.setCoupon(couponDc);
		OrderStatusType itemStatus = null;
		boolean result = false;
		switch(dto.getOrderType()) { 
			case call:
				dto.setStatus(OrderStatusType.주문접수);
				itemStatus = OrderStatusType.주문접수;
				break;
			case visit:
				if(dto.getSettleKind().equals("a")) {
					dto.setStatus(OrderStatusType.주문접수);
					itemStatus = OrderStatusType.주문접수;
				}else {
					dto.setStatus(OrderStatusType.배송완료);
					itemStatus = OrderStatusType.배송완료;
				}
				
				break;
			case direct:
				if(dto.getSettleKind().equals("a")||dto.getSettleKind().equals("m")) {
					dto.setStatus(OrderStatusType.주문접수);
					itemStatus = OrderStatusType.주문접수;
				}else {
					dto.setStatus(OrderStatusType.배송완료);
					itemStatus = OrderStatusType.배송완료;
				}
				break;
			case donate:
				dto.setStatus(OrderStatusType.배송완료);
				itemStatus = OrderStatusType.배송완료;
				break;	
			case whole:
				dto.setStatus(OrderStatusType.주문접수);
				itemStatus = OrderStatusType.주문접수;
				break;
			case cafe:
				dto.setStatus(OrderStatusType.배송완료);
				itemStatus = OrderStatusType.배송완료;
				break;
			case mall:
				System.err.println(dto.getSettleKind());
				System.err.println("sjdhfkjshkfjhsdjfjksflkjkkk");
				if(dto.getSettleKind().equals("a")) {
					dto.setStatus(OrderStatusType.주문접수);
					itemStatus = OrderStatusType.주문접수;
				}else {
					dto.setCashReceiptYn("");
					dto.setStatus(OrderStatusType.결제시도);
					itemStatus = OrderStatusType.결제시도;
				}
				break;
		default:
			break;
			
		}
		//주문인서트
		result=orderMapper.orderInsert(dto); 
		
		//주문상품 인서트
		for(GoodsDto goodsDto : dto.getOrderItemList()) {
			GoodsOptionDto checkGoodsDto = goodsMapper.selectOption(goodsDto.getSno());
			Integer price =(int) Math.floor( checkGoodsDto.getPrice()* ( (100- (memberDto.getDc()*1.0 ) )/100 ) )*goodsDto.getEa() ; //회원 할인적용한 판매가
			System.err.println(checkGoodsDto.getPrice());
			System.err.println(dto.getCoupon());
			System.err.println((dto.getCoupon()*1.0)/100);
			System.err.println(memberDto.getDc());
			System.err.println(goodsDto.getEa());
			System.err.println(couPonPercent);
			System.err.println(Math.floor(checkGoodsDto.getPrice()* ((couPonPercent*1.0) /100)));
			Integer coupon = (int) Math.floor(checkGoodsDto.getPrice()*(couPonPercent*1.0/100))*goodsDto.getEa();
			Integer memberDc =(int) Math.ceil( checkGoodsDto.getPrice()* ( (memberDto.getDc()*1.0 ) /100 ) )*goodsDto.getEa() ; //회원 할인금액
			double saveEmoneyPercent=emoneyMapper.emoneyInfo().getSaveEmoneyPercent()/100;
			OrderItemDto itemDto = new OrderItemDto();
			itemDto.setOrderNo(dto.getOrderNo()); 
			itemDto.setGoodsNo(checkGoodsDto.getGoodsNo());
			itemDto.setGoodsName(checkGoodsDto.getGoodsName());
			itemDto.setOptionNo(checkGoodsDto.getSno());
			itemDto.setOpt1(checkGoodsDto.getOpt1());
			itemDto.setOpt2(checkGoodsDto.getOpt2());
			itemDto.setPrice(checkGoodsDto.getPrice());
			if(checkGoodsDto.getReserve()!=null) //상품별 적립금이 있으면,
				itemDto.setReserve(checkGoodsDto.getReserve()*goodsDto.getEa());	
			else // 상품별 적립금이 없으면,, 전체 적립금따라감
				itemDto.setReserve((int) Math.floor(price*saveEmoneyPercent)*goodsDto.getEa());
			
			itemDto.setCoupon(coupon);
			itemDto.setMemberDc(memberDc);
			itemDto.setEa(goodsDto.getEa());
			itemDto.setItemStatus(itemStatus);
			orderItemMapper.orderItemInsert(itemDto); 
		}
		//배송완료일경우 마일리지 적립, //몰주문일경우 , 바로 배송완료인경우가 없는듯?? 있을꺼같으면 내용 추가해야됨,
		if(dto.getOrderType().equals(OrderType.mall)) {
			 
		
		}
		return result;
		//		dto.set
		
//		GoodsDto goodsDto = new GoodsDto();
//		goodsDto.setMemberNo(dto.getMemberNo());
//		goodsDto.setReceiverName(dto.getReceiverName());
//		goodsDto.setReceiverPhone(dto.getReceiverPhone());
//		goodsDto.setReceiverMobile(dto.getReceiverMobile());
//		goodsDto.setZipcode(dto.getZipcode());
//		goodsDto.setAddress(dto.getAddress());
//		goodsDto.setSubAddress(dto.getSubAddress());
//		goodsDto.setMemo(dto.getMemo());
//		goodsDto.setAdminMemo(dto.getAdminMemo());
//		goodsDto.setSettleLog(dto.getSettleLog());
//		goodsDto.setSettleKind(dto.getSettleKind());
//		goodsDto.setStatus(dto.getStatus());
//		goodsDto.setOriginPrice(originPrice);
//		goodsDto.setMemberDc(sumMemberDc);
//		goodsDto.setEmoney(dto.getEmoney());
//		goodsDto.setCoupon(couponDc);
//		goodsDto.setEnuri(dto.getEnuri());
//		goodsDto.setDeliveryType(dto.getDeliveryType());
//		goodsDto.setDeliveryTitle(dto.getDeliveryTitle());
//		goodsDto.setDeliveryPrice(dto.getDeliveryPrice());
//		goodsDto.setBankAccount(bankAccount);
//		goodsDto.setBankSender(bankSender);
//		goodsDto.setBankName(bankName);
//		goodsDto.setDeliveryNo(deliveryNo);
//		goodsDto.setDeliveryCode(deliveryCode);
//		goodsDto.setOrderType(orderType);
//		goodsDto.setCreateTime(createTime);
//		goodsDto.setPaymentTime(paymentTime);
//		goodsDto.setDeliveryTime(deliveryTime);
//		goodsDto.setOrderCompleteTime(orderCompleteTime);
//		goodsDto.setCashReceiptNo(cashReceiptNo);
//		goodsDto.setCashReceiptUrl(cashReceiptUrl);
//		goodsDto.setCashReceiptIdentityNumber(cashReceiptIdentityNumber);
//		goodsDto.setCashReceiptYn(dto.getCashReceiptYn());
//		goodsDto.setTossOrderNo(tossOrderNo);
//		goodsDto.setTossKey(tossKey);
//		goodsDto.setUnpaid(unpaid);
//		goodsDto.setCatalog(catalog);
//		goodsDto.setUnpaidMemo(unpaidMemo);
		// 실결제금액
	}

	@Override
	public boolean updateOrder(OrderDto orderDto) throws Exception {
		
		return orderMapper.updateOrder(orderDto);
	}

	@Override
	public OrderDto order(Long orderNo) throws Exception {
		return orderMapper.order(orderNo);
	}

}
