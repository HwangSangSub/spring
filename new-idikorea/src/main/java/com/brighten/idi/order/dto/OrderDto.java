package com.brighten.idi.order.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.brighten.idi.enumerate.OrderStatusType;
import com.brighten.idi.enumerate.OrderType;
import com.brighten.idi.enumerate.YesNo;
import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.util.BriSearchDateDto;
import com.fasterxml.jackson.annotation.JsonFormat;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class OrderDto extends BriSearchDateDto{
	
	@Schema(description = "주문번호")
	Long orderNo;
	
	@Schema(description = "주문자회원번호")
	Integer memberNo;
	 
	@Schema(description = "주문자회원이름")
	String memberName;
	
	@Schema(description = "주문명")
	String orderName;
	
	@Schema(description = "발송여부 Y발송됨(송장번호있음) , N 발송안됨")
	String deliveryCodeCheck;
	
	@Schema(description = "주문자회원아이디")
	String memberId;
	
	@Schema(description = "받는사람이름") 
	String receiverName;
	
	@Schema(description = "엑셀출력 플래그값 Y이면 전체조회 , N 이면 체크박스 선택조회")
	String flag;
	
	@Schema(description = "받는사람전화번호")
	String receiverPhone;
	
	@Schema(description = "받는사람휴대폰번호")
	String receiverMobile;
	 
	@Schema(description = "받는사람우편번호")
	String zipcode;
	
	@Schema(description = "주문번호 리스트(엑셀선택출력시)")
	List<String> orderNoList;
	
	@Schema(description = "받는사람주소")
	String address; 
	
	@Schema(description = "받는사람상세주소")
	String subAddress;
	
	@Schema(description = "배송시요청사항")
	String memo;
	
	@Schema(description = "택배사명")
	String company;
	
	@Schema(description = "송장조회url")
	String deliveryUrl;
	
	@Schema(description = "관리자메모")
	String adminMemo; 
	
	@Schema(description = "결제로그")
	String settleLog;
	
	@Schema(description = "결제종류")
	String settleKind;
	
	@Schema(description = "결제상태")
	OrderStatusType status; 
	
	@Schema(description = "정상금액")
	Integer originPrice;
	
	@Schema(description = "멤버그룹할인")
	Integer memberDc;
	
	@Schema(description = "적립금할인액")
	Integer emoney;
	
	@Schema(description = "쿠폰할인액")
	Integer coupon;
	
	@Schema(description = "에누리금액")
	Integer enuri;
	
	@Schema(description = "배송비타입")
	String deliveryType;
	
	@Schema(description = "배송종류")
	String deliveryTitle;
	
	@Schema(description = "배송비")
	Integer deliveryPrice;
	
	@Schema(description = "실결제금액")
	Integer orderPrice;
	
	@Schema(description = "계좌번호")
	String bankAccount;
	
	@Schema(description = "보내는사람이름")
	String bankSender;
	
	@Schema(description = "은행명")
	String bankName;
	
	@Schema(description = "택배사코드")
	String deliveryNo;
	
	@Schema(description = "송장번호")
	String deliveryCode;
	
	@Schema(description = "주문방법 mall call")
	OrderType orderType;
	
	@Schema(description = "주문시간")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss")
	LocalDateTime createTime;
	
	@Schema(description = "결제완료시간")
	LocalDateTime paymentTime;
	
	@Schema(description = "배송시작시간")
	LocalDateTime deliveryTime;
	 
	@Schema(description = "배송완료시간")
	LocalDateTime orderCompleteTime;
	 
	@Schema(description = "현금영수증번호(응답키)") 
	String cashReceiptNo;
	
	@Schema(description = "현금영수증확인 url")
	String cashReceiptUrl;
	
	@Schema(description = "현금영수증 휴대폰or사업자번호")
	String cashReceiptIdentityNumber;
	
	@Schema(description = "현금영수증 사용여부") 
	String cashReceiptYn;
	
	@Schema(description = "기존현금영수증코드 이전후엔 토스결제번호로 통합")
	String cashReceiptCode;
	
	@Schema(description = "현금영수증 응답상태 ( IN_PROGRESS : 발급 대기 , COMPLETED : 발급 , FAILED : 실패)  ")
	String cashReceiptStatus;
	
	@Schema(description = "발행용도 0:개인소득공제용 , 1:사업자증빙용 ")
	String cashReceiptOprion;
	
	@Schema(description = "토스결제번호")
	String tossOrderNo;
	
	@Schema(description = "토스결제응답키")
	String tossKey;
	
	@Schema(description = "상태별카운트")
	String statusCount;
	
	@Schema(description = "날짜조회타입")
	String dateType;
	
	@Schema(description = "주문검색값")
	String orderSearchValue;
	  
	@Schema(description = "주문검색필터")
	String orderSearchOption; 
	
	@Schema(description = "환불금액합계")
	Integer totalRefund;
	
	@Schema(description = "환불적립금합계")
	Integer totalRefundEmoney;
	
	@Schema(description = "환불상품수량") 
	Integer totalRefundEa;
	
	@Schema(description = "미수금")
	Integer unpaid;
	
	@Schema(description = "미수금메모")
	String unpaidMemo;
	
	@Schema(description = "전화주문 lg 카드결제번호") 
	String lgOrderNo;
	
	@Schema(description = "주문아이템리스트")
	List<GoodsDto> orderItemList;
	
	@Schema(description = "카탈로그 발송여부")
	YesNo catalog;
	
	public void setOrderType(String orderType) {

		switch(orderType) {
		case "쇼핑몰":
			this.orderType = OrderType.mall;
			break;
		case "전화":
			this.orderType = OrderType.call;
			break;
		case "내방":
			this.orderType = OrderType.visit;
			break;
		case "내방현금":
			this.orderType = OrderType.visit;
			break;
		case "내방카드":
			this.orderType = OrderType.visit;
			break;
		case "도매점": 
			this.orderType = OrderType.whole;
			break;
		case "기증":
			this.orderType = OrderType.donate;
			break;
		case "직접배송":
			this.orderType = OrderType.direct;
			break; 
		case "카페":
			this.orderType = OrderType.cafe;
			break;
		case "전체":
			this.orderType = OrderType.all;
			break;
		case "mall":
			this.orderType = OrderType.쇼핑몰;
			break;
		case "call":
			this.orderType = OrderType.전화;
			break;
		case "visit":
			this.orderType = OrderType.내방;
			break;
		case "whole":
			this.orderType = OrderType.도매점;
			break;
		case "donate":
			this.orderType = OrderType.기증;
			break;
		case "direct":
			this.orderType = OrderType.직접배송;
			break;
		case "cafe":
			this.orderType = OrderType.카페;
			break;

			
		}
	}
	
	public void setSettleKind(String settleKind) {
		switch(settleKind) {
		case "신용카드":
			this.settleKind = "c";
			break;
		case "무통장":
			this.settleKind = "a";
			break;
		case "계좌이체":
			this.settleKind = "o";
			break;
		case "전액할인":
			this.settleKind = "d";
			break;
		case "핸드폰":
			this.settleKind = "h";
			break;
		case "현금":
			this.settleKind = "m";
			break;
		case "매장카드":
			this.settleKind = "s";
			break;
		case "가상계좌":
			this.settleKind = "v";
			break;
		case "이디페이":
			this.settleKind = "i";
			break;
		case "c":
			this.settleKind = "신용카드";
			break;
		case "a":
			this.settleKind = "무통장";
			break;
		case "o":
			this.settleKind = "계좌이체";
			break;
		case "d":
			this.settleKind = "전액할인";
			break;
		case "h":
			this.settleKind = "핸드폰";
			break;
		case "m":
			this.settleKind = "현금";
			break;
		case "s":
			this.settleKind = "매장카드";
			break;
		case "v":
			this.settleKind = "가상계좌";
			break;
		case "i":
			this.settleKind = "이디페이";
			break;
		default : 
			this.settleKind = settleKind;
		break;
		}
	}
	
	public String getSettleKind() {
		return this.settleKind;
	}
	
	public OrderType getOrderType() {
		return this.orderType;
	}
}
