package com.brighten.idi.order.cart.controller;


import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.brighten.idi.goods.dto.GoodsDto;
import com.brighten.idi.order.cart.service.CartService;
import com.brighten.idi.util.BriException;
import com.brighten.idi.util.SessionUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@RestController
@RequiredArgsConstructor
public class CartController {

	private final CartService cartService;
	
	@PostMapping(value="/api/v1/user/cart")
	public boolean userCart(@RequestBody GoodsDto dto  , HttpServletRequest req) throws Exception{
		if(!SessionUtil.isLogin()) { //비회원구매
			String uuid = null;
			HttpSession session = req.getSession();
			System.err.println(session.getAttribute("uuid"));
			System.err.println("!!!");
			if(session.getAttribute("uuid")==null) { //세션에 저장된 uuid 값이없으면? => 처음담는 상품,,
				uuid = UUID.randomUUID().toString();
				dto.setUuid(uuid);
				session.setAttribute("uuid", uuid);
			}else if(session.getAttribute("uuid")!=null) {//uuid있으면? => 장바구니 이미 담긴상품이있는경우,,
				dto.setUuid(session.getAttribute("uuid").toString());
			}
			
		}else { //회원구매
			System.err.println(SessionUtil.getMemberNo());
			dto.setMemberNo(SessionUtil.getMemberNo());
		}
		
		if(cartService.cartList(dto).size()>0) { //장바구니에 있던거 또 담는경우,
			throw new BriException(HttpStatus.BAD_REQUEST,"이미"+ ( dto.getCartType().equals("Y")? "장바구니":"관심상품") +"에 담긴 상품입니다." , 403);
		}

		return 	cartService.insertCart(dto);
	}
    
} 
   