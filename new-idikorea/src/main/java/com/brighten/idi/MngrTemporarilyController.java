package com.brighten.idi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.brighten.idi.brand.mapper.BrandMapper;
import com.brighten.idi.category.mapper.CategoryMapper;
import com.brighten.idi.delivery.mapper.DeliveryMapper;
import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.goods.mapper.GoodsMapper;
import com.brighten.idi.goods.service.GoodsService;
import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.mapper.MemberMapper;
import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.order.mapper.OrderMapper;
import com.brighten.idi.order.service.OrderService;
import com.brighten.idi.util.SessionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MngrTemporarilyController {
	
	private final OrderMapper orderMapper;
	
	private final OrderService orderService;
	
	private final MemberMapper memberMapper;

	private final GoodsMapper goodsMapper;
	
	private final GoodsService goodsService;
	
	private final CategoryMapper categoryMapper;
	
	private final BrandMapper brandMapper;
	
	private final DeliveryMapper deliveryMapper;
	/**
	 * 관리자로그인
	 * @return
	 * @throws Exception
	 */
    @GetMapping("/test-image")
    public Resource getTestImage() {
    	System.err.println("kjdjlk");
    	System.err.println(new FileSystemResource("../upload/default/20230921_094423.jpg"));
        return new FileSystemResource("../upload/default/20230921_094423.jpg");
    }
	
	@GetMapping("/mngr/login/index")
	public String mngr_login_index() throws Exception {
		return "/mngr/pages/login/login_index";
	}

	/**
	 * 주문관리 > 주문목록
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/mngr/order/list/index")
	public String mngr_order_list_index() throws Exception { 
		System.err.println("주문리스트페이지");
		System.err.println(SessionUtil.getPassword());
		return "/mngr/pages/order_list/list_index"; 
	}
 
	/**
	 * 주문관리 > 주문목록 - 팝업 상세정보
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/mngr/order/{orderNo}/list/popup/detail")
	public String mngr_order_list_popup_detail(@PathVariable(name="orderNo") Long orderNo , ModelMap mm) throws Exception {
		mm.put("orderItemList", orderMapper.orderItem(orderNo));
		OrderDto orderDto = orderService.order(orderNo);
		mm.put("orderInfo", orderDto); 
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberId(orderDto.getMemberId());
		mm.put("memberInfo", memberMapper.member(memberDto)); 
		System.err.println("!!!!!!!!!!!!!!");
		return "/mngr/pages/order_list/popup_detail";  
	} 
 
	/**  
	 * 주문관리 > 주문목록 - 팝업 선택상품취소
	 * @return 
	 * @throws Exception
	 */
	@GetMapping("/mngr/order/list/popup/cancel")
	public String mngr_order_list_popup_cancel(@RequestParam("arr") Long[] arr , @RequestParam("orderNo") Long orderNo , ModelMap mm) throws Exception {
		List<GoodsDto> list= orderMapper.orderItem(orderNo);
		List<GoodsDto> deleteArr= new ArrayList<>();
		Integer cancelPrice = 0;
		Integer orderPrice = 0;
		Integer totalMemberDc = 0;
		Integer totalCouponDc = 0;
		for(GoodsDto dto : list) {
			cancelPrice+=dto.getPrice();
			for(Long i : arr) {
				if(dto.getItemNo().equals(i)) {
					deleteArr.add(dto);
				}
				
			}
			if(!dto.getItemStatus().equals("주문취소")) {
				orderPrice += dto.getPrice() * dto.getEa();
				totalMemberDc += dto.getMemberDc() * dto.getEa();
				totalCouponDc += dto.getCoupon() * dto.getEa();
				
			}
		}
		mm.put("orderInfo", orderService.order(orderNo)); 
		mm.put("orderItemList", deleteArr);
		mm.put("cancelPrice", cancelPrice);
		mm.put("orderPrice", orderPrice);
		mm.put("totalMemberDc", totalMemberDc);
		mm.put("totalCouponDc", totalCouponDc);
		return "/mngr/pages/order_list/popup_cancel";
	}

	/** 
	 * 주문관리 > 주문목록 - 팝업 현금영수증신청
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/mngr/order/list/popup/receipt")
	public String mngr_order_list_popup_receipt() throws Exception {
		return "/mngr/pages/order_list/popup_receipt";
	}

	@GetMapping("/mngr/order/call/popup/product")
	public String mngr_order_call_popup_product(ModelMap mm) throws Exception {
		mm.put("brandList", brandMapper.brand()); 
		mm.put("category",categoryMapper.category(null));
		return "/mngr/pages/order_call/popup_product";
	}

	@GetMapping("/mngr/order/call/index")
	public String mngr_order_call_index(ModelMap mm) throws Exception {
		mm.put("delivery", deliveryMapper.deliveryInfo());
		System.err.println(deliveryMapper.deliveryInfo());
		return "/mngr/pages/order_call/call_index";
	}

	@GetMapping("/mngr/order/cancel/index")
	public String mngr_order_cancel_index() throws Exception {
		return "/mngr/pages/order_cancel/cancel_index";
	}

	@GetMapping("/mngr/order/return/index")
	public String mngr_order_return_index() throws Exception {
		return "/mngr/pages/order_return/return_index";
	}

	@GetMapping("/mngr/order/refund/index")
	public String mngr_order_refund_index() throws Exception {
		return "/mngr/pages/order_refund/refund_index";
	}

	@GetMapping("/mngr/order/payable/index")
	public String mngr_order_payable_index() throws Exception {
		return "/mngr/pages/order_payable/payable_index";
	}
	
	@GetMapping("/mngr/order/payable/popup/detail/")
	public String mngr_order_payable_popup_detail() throws Exception {
		return "/mngr/pages/order_payable/popup_detail";
	}

	@GetMapping("/mngr/postoffice/invoice/index")
	public String mngr_postoffice_invoice_index() throws Exception {
		return "/mngr/pages/postoffice_invoice/invoice_index"; 
	}

	@GetMapping("/mngr/postoffice/register/index")
	public String mngr_postoffice_register_index() throws Exception {
		return "/mngr/pages/postoffice_register/register_index";
	}

	@GetMapping("/mngr/delivery/register/index")
	public String mngr_delivery_register_index() throws Exception {
		return "/mngr/pages/delivery_register/register_index";
	}

	@GetMapping("/mngr/deposit/check/index")
	public String mngr_deposit_check_index() throws Exception {
		return "/mngr/pages/deposit_check/check_index";
	}

	@GetMapping("/mngr/receipt/inquiry/index")
	public String mngr_receipt_inquiry_index() throws Exception {
		return "/mngr/pages/receipt_inquiry/inquiry_index";
	}

	@GetMapping("/mngr/receipt/issue/index")
	public String mngr_receipt_issue_index() throws Exception {
		return "/mngr/pages/receipt_issue/issue_index";
	} 

	/**
	 * 회원 > 회원관리 > 회원목록
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/mngr/member/management/list/index")
	public String mngr_member_management_list_index(MemberDto memberDto , ModelMap mm) throws Exception {
		mm.put("levelList", memberMapper.memberGroupList());
		return "/mngr/pages/member_management_list/list_index"; 
	}
	
	@GetMapping("/mngr/member/management/popup/list/index")
	public String mngr_member_management_popup_list_index(MemberDto memberDto , ModelMap mm) throws Exception {
		mm.put("levelList", memberMapper.memberGroupList());
		return "/mngr/pages/member_management_list/popup_list_index";
	} 
	
	/**
	 * 회원 > 회원관리 > 회원목록 - 팝업 상세보기
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/mngr/member/management/list/popup/detail/{memberId}")
	public String mngr_member_management_list_popup_detail(@PathVariable(name ="memberId") String memberId , ModelMap mm) throws Exception {
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberId( memberId);
		mm.put("memberInfo", memberMapper.member(memberDto));
		mm.put("category", categoryMapper.category(null));
		return "/mngr/pages/member_management_list/popup_detail";
	}

	@GetMapping("/mngr/member/management/detail/index")
	public String mngr_member_management_detail_index() throws Exception {
		return "/mngr/pages/member_management_detail/detail_index";
	}

	@GetMapping("/mngr/member/management/detail/detail")
	public String mngr_member_management_detail_detail() throws Exception {
		return "/mngr/pages/member_management_detail/detail_detail";
	}

	@GetMapping("/mngr/member/management/group/index")
	public String mngr_member_management_group_index() throws Exception {
		return "/mngr/pages/member_management_group/group_index";
	}

	@GetMapping("/mngr/member/management/group/detail")
	public String mngr_member_management_group_detail() throws Exception {
		return "/mngr/pages/member_management_group/group_detail";
	}

	@GetMapping("/mngr/member/management/connect/index")
	public String mngr_member_management_connect_index() throws Exception {
		return "/mngr/pages/member_management_connect/connect_index";
	}

	@GetMapping("/mngr/member/management/apply/index")
	public String mngr_member_management_apply_index() throws Exception {
		return "/mngr/pages/member_management_apply/apply_index";
	}

	@GetMapping("/mngr/member/management/idi/index")
	public String mngr_member_management_idi_index() throws Exception {
		return "/mngr/pages/member_management_idi/idi_index";
	}

	@GetMapping("/mngr/member/management/abbey/index")
	public String mngr_member_management_abbey_index() throws Exception {
		return "/mngr/pages/member_management_abbey/abbey_index";
	}

	@GetMapping("/mngr/member/batch/accumulate/index")
	public String mngr_member_batch_accumulate_index() throws Exception {
		return "/mngr/pages/member_batch_accumulate/accumulate_index";
	}

	@GetMapping("/mngr/member/batch/group/index")
	public String mngr_member_batch_group_index() throws Exception {
		return "/mngr/pages/member_batch_group/group_index";
	}

	@GetMapping("/mngr/member/batch/approve/index")
	public String mngr_member_batch_approve_index() throws Exception {
		return "/mngr/pages/member_batch_approve/approve_index";
	}

	@GetMapping("/mngr/member/batch/notice/index")
	public String mngr_member_batch_notice_index() throws Exception {
		return "/mngr/pages/member_batch_notice/notice_index";
	}

	@GetMapping("/mngr/member/sms/shipment/index")
	public String mngr_member_sms_shipment_index() throws Exception {
		return "/mngr/pages/member_sms_shipment/shipment_index";
	}

	@GetMapping("/mngr/member/sms/detail/index")
	public String mngr_member_sms_detail_index() throws Exception {
		return "/mngr/pages/member_sms_detail/detail_index";
	}

	@GetMapping("/mngr/member/push/send/index")
	public String mngr_member_push_send_index() throws Exception {
		return "/mngr/pages/member_push_send/send_index";
	}

	@GetMapping("/mngr/member/push/detail/index")
	public String mngr_member_push_detail_index() throws Exception {
		return "/mngr/pages/member_push_detail/detail_index";
	}

	/**
	 * 상품 > 상품관리 > 상품목록 
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/mngr/product/management/list/index")
	public String mngr_product_management_list_index(ModelMap mm) throws Exception {
		mm.put("brandList", brandMapper.brand());
		mm.put("category", categoryMapper.category(null));
		return "/mngr/pages/product_management_list/list_index"; 
	}

	/** 
	 * 상품 > 상품관리 > 상품목록 > 상세정보 
	 * @return 
	 * @throws Exception
	 */
	@GetMapping("/mngr/product/{goodsNo}/management/list/popup/detail")
	public String mngr_product_management_list_popup_datail(@PathVariable(name="goodsNo") Long goodsNo , ModelMap mm) throws Exception {
		GoodsDto dto=goodsMapper.goods(goodsNo);
		dto.setBrandList(brandMapper.brand());
		mm.put("goods", dto); 
		mm.put("category", categoryMapper.category(null));
//		goodsService.goodsOptionList(goodsNo); 
	    ObjectMapper objectMapper = new ObjectMapper();
//	    String json = objectMapper.writeValueAsString(goodsService.goodsOptionList(goodsNo)); 
//	    System.err.println("aaaaa"); 
//	    System.err.println(json);
	    mm.put("optionList", goodsService.goodsOptionList(goodsNo));	 
	    System.err.println(mm.get("optionList")); 
		return "/mngr/pages/product_management_list/popup_detail"; 
	}  

	@GetMapping("/mngr/product/management/list/popup/detail")
	public String mngr_product_management_list_popup_datail(ModelMap mm) throws Exception {
		String[] values = {"countryList","makerList"};
		Map<String , Object> map = new HashMap<String,Object>(); 
		for(String value : values) {
			map.put(value, goodsMapper.makerList(value));
		} 
		
		map.put("brandList", brandMapper.brand());
		mm.put("category",categoryMapper.category(null));
		mm.put("goods", map);
		return "/mngr/pages/product_management_list/popup_detail";
	}

	@GetMapping("/mngr/product/management/register/index")
	public String mngr_product_management_register_index() throws Exception {
		return "/mngr/pages/product_management_register/register_index";
	}

	@GetMapping("/mngr/product/management/brand/index")
	public String mngr_product_management_brand_index() throws Exception {
		return "/mngr/pages/product_management_brand/brand_index";
	}

	@GetMapping("/mngr/product/management/modify/index")
	public String mngr_product_management_modify_index() throws Exception {
		return "/mngr/pages/product_management_modify/modify_index";
	}

	@GetMapping("/mngr/product/category/setup/index")
	public String mngr_product_category_setup_index() throws Exception {
		return "/mngr/pages/product_category_setup/setup_index";
	}

	@GetMapping("/mngr/product/category/sort/index")
	public String mngr_product_category_sort_index() throws Exception {
		return "/mngr/pages/product_category_sort/sort_index";
	}

	@GetMapping("/mngr/regular/discount/index")
	public String mngr_regular_discount_index() throws Exception {
		return "/mngr/pages/regular_discount/discount_index";
	}

	@GetMapping("/mngr/regular/list/index")
	public String mngr_regular_list_index() throws Exception {
		return "/mngr/pages/regular_list/list_index";
	}

	@GetMapping("/mngr/regular/call/index")
	public String mngr_regular_call_index(ModelMap mm) throws Exception {
		return "/mngr/pages/regular_call/call_index";
	}

	@GetMapping("/mngr/board/notice/index")
	public String mngr_board_notice_index() throws Exception {
		return "/mngr/pages/board_notice/notice_index";
	}

	@GetMapping("/mngr/board/qna/index")
	public String mngr_board_qna_index() throws Exception {
		return "/mngr/pages/board_qna/qna_index";
	}

	@GetMapping("/mngr/board/review/index")
	public String mngr_board_review_index() throws Exception {
		return "/mngr/pages/board_review/review_index";
	}

	@GetMapping("/mngr/board/one/index")
	public String mngr_board_one_index() throws Exception {
		return "/mngr/pages/board_one/one_index";
	}

	@GetMapping("/mngr/board/faq/index")
	public String mngr_board_faq_index() throws Exception {
		return "/mngr/pages/board_faq/faq_index";
	}

	@GetMapping("/mngr/board/event/index")
	public String mngr_board_event_index() throws Exception {
		return "/mngr/pages/board_event/event_index";
	}

	@GetMapping("/mngr/design/popup/index")
	public String mngr_design_popup_index() throws Exception {
		return "/mngr/pages/design_popup/popup_index";
	}

	@GetMapping("/mngr/design/main/slide/index")
	public String mngr_design_main_slide_index() throws Exception {
		return "/mngr/pages/design_main_slide/slide_index";
	}

	@GetMapping("/mngr/design/main/best/index")
	public String mngr_design_main_best_index() throws Exception {
		return "/mngr/pages/design_main_best/best_index";
	}

	@GetMapping("/mngr/design/main/careline/index")
	public String mngr_design_main_careline_index() throws Exception {
		return "/mngr/pages/design_main_careline/careline_index";
	}

	@GetMapping("/mngr/coupon/setup/index")
	public String mngr_coupon_setup_index() throws Exception {
		return "/mngr/pages/coupon_setup/setup_index";
	}

	@GetMapping("/mngr/coupon/list/index")
	public String mngr_coupon_list_index() throws Exception {
		return "/mngr/pages/coupon_list/list_index";
	}

	@GetMapping("/mngr/coupon/make/index")
	public String mngr_coupon_make_index() throws Exception {
		return "/mngr/pages/coupon_make/make_index";
	}

	@GetMapping("/mngr/etc/notice/index")
	public String mngr_etc_notice_index() throws Exception {
		return "/mngr/pages/etc_notice/notice_index";
	}

	@GetMapping("/mngr/etc/deposit/index")
	public String mngr_etc_deposit_index() throws Exception {
		return "/mngr/pages/etc_deposit/deposit_index";
	}

	@GetMapping("/mngr/etc/popup/index")
	public String mngr_etc_popup_index() throws Exception {
		return "/mngr/pages/etc_popup/popup_index";
	}

	@GetMapping("/mngr/setup/basics/index")
	public String mngr_setup_basics_index() throws Exception {
		return "/mngr/pages/setup_basics/basics_index";
	}

	@GetMapping("/mngr/setup/delivery/index")
	public String mngr_setup_delivery_index() throws Exception {
		return "/mngr/pages/setup_delivery/delivery_index";
	}

	@GetMapping("/mngr/setup/accumulate/index")
	public String mngr_setup_accumulate_index() throws Exception {
		return "/mngr/pages/setup_accumulate/accumulate_index";
	}

	@GetMapping("/mngr/setup/order/index")
	public String mngr_setup_order_index() throws Exception {
		return "/mngr/pages/setup_order/order_index";
	}

	@GetMapping("/mngr/setup/account/index")
	public String mngr_setup_account_index() throws Exception {
		return "/mngr/pages/setup_account/account_index";
	}

	@GetMapping("/mngr/setup/mail/one/index")
	public String mngr_setup_mail_one_index() throws Exception {
		return "/mngr/pages/setup_mail_one/one_index";
	}

	@GetMapping("/mngr/setup/mail/delivery/index")
	public String mngr_setup_mail_delivery_index() throws Exception {
		return "/mngr/pages/setup_mail_delivery/delivery_index";
	}

	@GetMapping("/mngr/setup/mail/id/index")
	public String mngr_setup_mail_id_index() throws Exception {
		return "/mngr/pages/setup_mail_id/id_index";
	}

	@GetMapping("/mngr/setup/mail/deposit/index")
	public String mngr_setup_mail_deposit_index() throws Exception {
		return "/mngr/pages/setup_mail_deposit/deposit_index";
	}

	@GetMapping("/mngr/setup/mail/order/index")
	public String mngr_setup_mail_order_index() throws Exception {
		return "/mngr/pages/setup_mail_order/order_index";
	}

	@GetMapping("/mngr/setup/mail/join/index")
	public String mngr_setup_mail_join_index() throws Exception {
		return "/mngr/pages/setup_mail_join/join_index";
	}

	@GetMapping("/mngr/setup/mail/withdrawal/index")
	public String mngr_setup_mail_withdrawal_index() throws Exception {
		return "/mngr/pages/setup_mail_withdrawal/withdrawal_index";
	}

	@GetMapping("/mngr/setup/notice/index")
	public String mngr_setup_notice_index() throws Exception {
		return "/mngr/pages/setup_notice/notice_index";
	}

	@GetMapping("/mngr/setup/terms/index")
	public String mngr_setup_terms_index() throws Exception {
		return "/mngr/pages/setup_terms/terms_index";
	}

	@GetMapping("/mngr/setup/personal/index")
	public String mngr_setup_personal_index() throws Exception {
		return "/mngr/pages/setup_personal/personal_index";
	}

	@GetMapping("/mngr/statistic/sale/index")
	public String mngr_statistic_sale_index() throws Exception {
		return "/mngr/pages/statistic_sale/sale_index";
	}

	@GetMapping("/mngr/statistic/delivery/index")
	public String mngr_statistic_delivery_index() throws Exception {
		return "/mngr/pages/statistic_delivery/delivery_index";
	}

	@GetMapping("/mngr/statistic/stock/index")
	public String mngr_statistic_stock_index() throws Exception {
		return "/mngr/pages/statistic_stock/stock_index";
	}
	
	@GetMapping("/error")
	public String error() throws Exception {
		return "/error";
	}
}
