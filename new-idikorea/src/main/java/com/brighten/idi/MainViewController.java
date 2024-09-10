package com.brighten.idi;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.brighten.idi.category.dto.CategoryDto;
import com.brighten.idi.category.mapper.CategoryMapper;
import com.brighten.idi.enumerate.OrderStatusType;
import com.brighten.idi.enumerate.YesNo;
import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.goods.mapper.GoodsMapper;
import com.brighten.idi.goods.service.GoodsService;
import com.brighten.idi.info.service.InfoService;
import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.mapper.MemberMapper;
import com.brighten.idi.member.service.MemberService;
import com.brighten.idi.order.cart.service.CartService;
import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.order.service.OrderService;
import com.brighten.idi.util.SessionUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@Controller
@RequiredArgsConstructor
public class MainViewController {

	private final MemberMapper memberMapper;
	
	private final MemberService memberService;

	private final GoodsService goodsService;
	
	private final CategoryMapper categoryMapper;
	
	private final GoodsMapper goodsMapper;
	
	private final OrderService orderService;
	
	private final ObjectMapper objectMapper;
	
	private final InfoService infoService;
	
	private final CartService cartService;

	
	@GetMapping("/")
	public String intro() throws Exception{
		log.info("index.jsp");
		return "/index";
	}
	
	@GetMapping("/mngr/login")
	public String adminLogin() throws Exception{
		log.info("mngr/index.jsp"); 
		return "/idi/mngr/login";
	}
	
	@GetMapping("/mngr/main")
	public String adminMain(ModelMap mm) throws Exception{
		log.info("mngr/main.jsp"); 
		mm.put("levelList", memberMapper.memberGroupList());
		return "/idi/mngr/main";
	}
	
	@GetMapping("/main")
	public String main() throws Exception{
		log.info("index.jsp");
		return "/index";
	}
	
//	유저페이지
//	메인
	@GetMapping("/user/main")
	public String userMain(ModelMap mm) throws Exception{
		log.info("/user/pages/main/index.jsp");
		mm.put("slide", goodsService.mainImageSlide());
		mm.put("bestSeller",new Gson().toJson( objectMapper.writeValueAsString(goodsService.mainBestSeller()) ));
		mm.put("careLine",new Gson().toJson( objectMapper.writeValueAsString(goodsService.mainCareLine()) ) );
		return "/user/pages/main/index"; 
	}
	
	
//	login
	@GetMapping("/user/login")
	public String userLogin() throws Exception{
		log.info("/user/pages/login/login_index.jsp");
		return "/user/pages/login/login_index";
	} 
	 
	
//	바구니 > 리스트
	@GetMapping("/user/basket/list")
	public String userBasketList(@RequestParam(name="regular") String regular , ModelMap mm) throws Exception{
		log.info("/user/pages/basket/basket_list.jsp"); 
		if(regular.equals("true")) {
			
		}else {
			GoodsDto dto = new GoodsDto();
			dto.setMemberNo(SessionUtil.getMemberNo());
			dto.setCartType("Y");
			mm.put("cartList" , cartService.cartList(dto));
		}
		return "/user/pages/basket/basket_list";
	}
	
//	바구니 > 주문서작성
	@PostMapping("/user/basket/order")
	public String userBasketOrder(@RequestParam(name="orderData") String orderData ,ModelMap mm) throws Exception{
		System.err.println(orderData);
		System.err.println(SessionUtil.isLogin());
		if(!SessionUtil.isLogin()) {
//			return "redirect : /user/login?msg='loginFail'";
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberNo(SessionUtil.getMemberNo());
		List<GoodsDto> list=objectMapper.readValue(orderData, new TypeReference<List<GoodsDto>>() {});
		mm.put("goodsList", goodsService.goodsByOptionSno(list));
		mm.put("memberInfo",memberService.member(memberDto));
		mm.put("bankList",infoService.bankList());
		log.info("/user/pages/basket/order_index.jsp");
		return "/user/pages/basket/order_index";
	}
	
	
	
//	바구니 > 주문 완료
	@GetMapping("/user/basket/complete")
	public String userBasketComplete(@RequestParam(name="orderNo") Long orderNo , ModelMap mm) throws Exception{
		log.info("/user/pages/basket/complete_index.jsp");
		mm.put("order",orderService.order(orderNo));
		return "/user/pages/basket/complete_index";
	}
	
	
//	바구니 > 비회원 주문내역/배송조회
	@GetMapping("/user/basket/detail")
	public String userBasketDetail() throws Exception{
		log.info("/user/pages/basket/basket_detail_index.jsp");
		return "/user/pages/basket/basket_detail_index";
	}
	
//	바구니 > 스피드주문
	@GetMapping("/user/basket/speed")
	public String userBasketSpeed() throws Exception{
		log.info("/user/pages/basket/basket_speed_index.jsp");
		return "/user/pages/basket/basket_speed_index";
	}
	
	
//	회원가입 > 약관동의
	@GetMapping("/user/join/agree")
	public String userJoinAgree() throws Exception{
		log.info("/user/pages/join/join_agree_index.jsp");
		return "/user/pages/join/join_agree_index";
	}
	
//	회원가입 > 정보입력
	@GetMapping("/user/join/info")
	public String userJoinInfo() throws Exception{
		log.info("/user/pages/join/join_info_index.jsp");
		return "/user/pages/join/join_info_index";
	}
	
//	회원가입 > 가입완료
	@GetMapping("/user/join/complete")
	public String userJoinComplete() throws Exception{
		log.info("/user/pages/join/join_complete_index.jsp");
		return "/user/pages/join/join_complete_index";
	}
	
//	회원가입 > 아이디/비밀번호 찾기
	@GetMapping("/user/join/search")
	public String userJoinSearch() throws Exception{
		log.info("/user/pages/join/join_search_index.jsp");
		return "/user/pages/join/join_search_index";
	}
	
	
	
	
//	제품 > 리스트 
	@GetMapping("/user/product/list")
	public String userProductList(ModelMap mm , @RequestParam(name="regular") String regular) throws Exception{
		log.info("/user/pages/product/product_list.jsp"); 
		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setUserOpen(1);
		goodsDto.setUseRegular(regular);
			
		List<CategoryDto> categoryList=categoryMapper.category("Y");
		List<GoodsDto> selectGoodsList =goodsService.goodsList(goodsDto);
		
		for(CategoryDto cateDto : categoryList) {
			
			for(GoodsDto dto : selectGoodsList) {
				if(cateDto.getCategoryCode().equals(dto.getCategory())) {
					cateDto.setFlag("N");
				}
			}
		}
		
		
		mm.put("goodsList",selectGoodsList); 
		mm.put("category", categoryList); 
		return "/user/pages/product/product_list"; 
	}
	
//	제품 > 상세
	@GetMapping("/user/product/{goodsNo}")
	public String userProductDetail(@PathVariable(value = "goodsNo") Long goodsNo , ModelMap mm) throws Exception{
		GoodsDto dto = goodsService.goods(goodsNo);
		dto.setOptionList(goodsService.goodsOptionList(goodsNo));
		mm.put("goods", dto);
		log.info("/user/pages/product/product_detail.jsp");
		return "/user/pages/product/product_detail";
	}
	
//	제품 > 굿즈
	@PostMapping("/user/order/select-wrapping")
	public String userProductGoods(@RequestParam(name="orderData") String orderData ,ModelMap mm) throws Exception{
//	public String userProductGoods(List<GoodsDto> orderData) throws Exception{
		GoodsDto dto = new GoodsDto();
		dto.setCategory("0");

		mm.put("orderData", orderData);
		mm.put("wrapping", goodsMapper.goodsList(dto));
		  
		log.info("/user/pages/product/product_goods_index.jsp"); 
		return "/user/pages/product/product_goods_index";
	}
    
	@GetMapping("/user/tossPayments")  
	public String tossPopup() throws Exception{  
		return "/user/toss/toss_popup";
	}
	
	@GetMapping("/user/tossPayments/success")
	public String tossSuccess(@RequestParam(value = "orderId") Long orderId ) throws Exception{
		OrderDto orderDto = new OrderDto();
		orderDto.setOrderNo(orderId);
		orderDto.setStatus(OrderStatusType.결제확인);
		orderService.updateOrder(orderDto);
		return "/user/toss/toss_popup_success";
	}
	
	@GetMapping("/user/tossPayments/fail")
	public String tossFail(@RequestParam(value = "orderId") Long orderId) throws Exception{
		
		return "/user/toss/toss_popup_fail";
	}
	
	
	
//	브랜드소개
	@GetMapping("/user/brand")
	public String userBrand() throws Exception{
		log.info("/user/pages/brand/brand_index.jsp");
		return "/user/pages/brand/brand_index";
	}
	

//	FAQ
	@GetMapping("/user/faq")
	public String userFaq() throws Exception{
		log.info("/user/pages/faq/faq_index.jsp");
		return "/user/pages/faq/faq_index";
	}
	
//	media > 방송 보도자료
	@GetMapping("/user/media/video")
	public String userMediaVideo() throws Exception{
		log.info("/user/pages/media/media_video_index.jsp");
		return "/user/pages/media/media_video_index";
	}
	
//	media > 일반 보도자료
	@GetMapping("/user/media/press")
	public String userMediaPress() throws Exception{
		log.info("/user/pages/media/media_press_index.jsp");
		return "/user/pages/media/media_press_index";
	}
	
//	event >  공지사항
	@GetMapping("/user/notice")
	public String userNotice() throws Exception{
		log.info("/user/pages/event/event_notice_index.jsp");
		return "/user/pages/event/event_notice_index";
	}
	
//	event > 이벤트
	@GetMapping("/user/event")
	public String userEvent() throws Exception{
		log.info("/user/pages/event/event_index.jsp");
		return "/user/pages/event/event_index";
	}
	
	
	
//	mypage > 마이페이지 첫페이지(대시보드)
	@GetMapping("/user/mypage/dashboard")
	public String userMypageDashboard() throws Exception{
		log.info("/user/pages/mypage/mypage_dashboard_index.jsp");
		return "/user/pages/mypage/mypage_dashboard_index";
	}
	
//	mypage > 나의정보관리 > 회원정보수정 > 비밀번호 확인
	@GetMapping("/user/mypage/info/modify/pw")
	public String userMypageInfoModifyPw() throws Exception{
		log.info("/user/pages/mypage/mypage_info_modify_pw_index.jsp");
		return "/user/pages/mypage/mypage_info_modify_pw_index";
	}
	
//	mypage > 나의정보관리 > 회원정보수정 > 회원정보수정 페이지
	@GetMapping("/user/mypage/info/modify/form")
	public String userMypageInfoModifyForm() throws Exception{
		log.info("/user/pages/mypage/mypage_info_modify_form_index.jsp");
		return "/user/pages/mypage/mypage_info_modify_form_index";
	}
	
//	mypage > 나의정보관리 > 후원회원신청
	@GetMapping("/user/mypage/info/support")
	public String userMypageInfoSupport() throws Exception{
		log.info("/user/pages/mypage/mypage_info_support_index.jsp");
		return "/user/pages/mypage/mypage_info_support_index";
	}
	
//	mypage > 나의정보관리 > 후원회원연동
	@GetMapping("/user/mypage/info/interlock")
	public String userMypageInfoInterlock() throws Exception{
		log.info("/user/pages/mypage/mypage_info_interlock_index.jsp");
		return "/user/pages/mypage/mypage_info_interlock_index";
	}
	
//	mypage > 나의정보관리 > 배송지관리
	@GetMapping("/user/mypage/info/address")
	public String userMypageInfoAddress() throws Exception{
		log.info("/user/pages/mypage/mypage_info_address_index.jsp");
		return "/user/pages/mypage/mypage_info_address_index";
	}
	
//	mypage > 나의정보관리 > 비밀번호 변경
	@GetMapping("user/mypage/info/pw")
	public String userMypageInfoPw() throws Exception{
		log.info("/user/pages/mypage/mypage_info_pw_index.jsp");
		return "/user/pages/mypage/mypage_info_pw_index";
	}
	
//	mypage > 나의정보관리 > 회원탈퇴
	@GetMapping("user/mypage/info/withdrawal")
	public String userMypageInfoWithdrawal() throws Exception{
		log.info("/user/pages/mypage/mypage_info_withdrawal_index.jsp");
		return "/user/pages/mypage/mypage_info_withdrawal_index";
	}
	
//	mypage > 나의 정기구매 > 정기구매 장바구니
	
	
//	mypage > 나의 정기구매 > 정기구매 내역조회
	@GetMapping("user/mypage/regular/history")
	public String userMypageRegularHistory() throws Exception{
		log.info("/user/pages/mypage/mypage_regular_history_index.jsp");
		return "/user/pages/mypage/mypage_regular_history_index";
	}
	
	
//	mypage > 나의 구매내역 > 주문내역/배송조회
	@GetMapping("user/mypages/order/history")
	public String userMypageOrderHistory() throws Exception{
		log.info("/user/pages/mypage/mypage_order_history_index.jsp");
		return "/user/pages/mypage/mypage_order_history_index";
	}
	
//	mypage > 나의 구매내역 > 취소내역
	@GetMapping("user/mypages/order/cancel")
	public String userMypageOrderCanel() throws Exception{
		log.info("/user/pages/mypage/mypage_order_cancel_index.jsp");
		return "/user/pages/mypage/mypage_order_cancel_index";
	}
	
//	mypage > 나의 구매내역 > 반품내역
	@GetMapping("user/mypages/order/refund")
	public String userMypageOrderRefund() throws Exception{
		log.info("/user/pages/mypage/mypage_order_refund_index.jsp");
		return "/user/pages/mypage/mypage_order_refund_index";
	}

	
//	mypage > 나의 쇼핑활동 > IDI페이 관리
	@GetMapping("user/mypages/activity/pay")
	public String userMypageActivityPay() throws Exception{
		log.info("/user/pages/mypage/mypage_activity_pay_index.jsp");
		return "/user/pages/mypage/mypage_activity_pay_index";
	}
	

//	mypage > 나의 쇼핑활동 > 1:1문의
	@GetMapping("user/mypages/activity/question")
	public String userMypageActivityQuestion() throws Exception{
		log.info("/user/pages/mypage/mypage_activity_question_index.jsp");
		return "/user/pages/mypage/mypage_activity_question_index";
	}
	
//	mypage > 나의 쇼핑활동 > 상품문의
	@GetMapping("user/mypages/activity/qna")
	public String userMypageActivityQna() throws Exception{
		log.info("/user/pages/mypage/mypage_activity_qna_index.jsp");
		return "/user/pages/mypage/mypage_activity_qna_index";
	}
	
//	mypage > 나의 쇼핑활동 > 상품후기
	@GetMapping("user/mypages/activity/review")
	public String userMypageActivityReview() throws Exception{
		log.info("/user/pages/mypage/mypage_activity_review_index.jsp");
		return "/user/pages/mypage/mypage_activity_review_index";
	}
	
//	mypage > 나의 쇼핑활동 > 상품보관함
	@GetMapping("user/mypages/activity/wish")
	public String userMypageActivityWish() throws Exception{
		log.info("/user/pages/mypage/mypage_activity_wish_index.jsp");
		return "/user/pages/mypage/mypage_activity_wish_index";
	}
	
//	mypage > 나의 쇼핑활동 > 적립금
	@GetMapping("user/mypages/activity/emoney")
	public String userMypageActivityEmoney() throws Exception{
		log.info("/user/pages/mypage/mypage_activity_emoney_index.jsp");
		return "/user/pages/mypage/mypage_activity_emoney_index";
	}
	
//	mypage > 나의 쇼핑활동 > 쿠폰내역
	@GetMapping("user/mypages/activity/coupon")
	public String userMypageActivityCoupon() throws Exception{
		log.info("/user/pages/mypage/mypage_activity_coupon_index.jsp");
		return "/user/pages/mypage/mypage_activity_coupon_index";
	}
	
//	mypage > 나의 쇼핑활동 > 최근 본 상품
	@GetMapping("user/mypages/activity/recently")
	public String userMypageActivityRecently() throws Exception{
		log.info("/user/pages/mypage/mypage_activity_recently_index.jsp");
		return "/user/pages/mypage/mypage_activity_recently_index";
	}
	
	
	
//	안내 > 개인정보취급방침
	@GetMapping("user/guide/personal")
	public String userGuidePersonal() throws Exception{
		log.info("/user/pages/guide/guide_personal_index.jsp");
		return "/user/pages/guide/guide_personal_index";
	}
	
	
//	안내 > 이용약관
	@GetMapping("user/guide/terms")
	public String userGuideTerms() throws Exception{
		log.info("/user/pages/guide/guide_terms_index.jsp");
		return "/user/pages/guide/guide_terms_index";
	}
	
	
//	안내 > 고객센터
	@GetMapping("user/guide/center")
	public String userGuideCenter() throws Exception{
		log.info("/user/pages/guide/guide_center_index.jsp");
		return "/user/pages/guide/guide_center_index";
	}
	
	
//	안내 > 이용안내
	@GetMapping("user/guide/info")
	public String userGuideInfo() throws Exception{
		log.info("/user/pages/guide/guide_info_index.jsp");
		return "/user/pages/guide/guide_info_index";
	}
	
	
    
}
