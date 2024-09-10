package com.brighten.idi.test;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.module.ncp.service.NcpService;
import com.brighten.idi.util.SessionUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@RestController
@RequiredArgsConstructor
public class TestController {

	private final NcpService ncpService;
	
	@GetMapping("/api/v1/test")
	public void member() throws Exception{
		System.out.println("Working Directory = " + System.getProperty("user.dir"));
		System.err.println(SessionUtil.getId());
		ncpService.ncpSend("01025109705", "[이디코리아] \r\n한동일님의 주문의 입금이 확인되었습니다.", "deposit");
	}
	
	
	
    
    
} 
   