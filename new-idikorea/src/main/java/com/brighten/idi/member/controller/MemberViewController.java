package com.brighten.idi.member.controller;


import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.mapper.MemberMapper;
import com.brighten.idi.member.service.MemberService;
import com.brighten.idi.test.TestMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@Controller
@RequiredArgsConstructor
public class MemberViewController {

	private final TestMapper test;

	private final MemberService memberService;
	
	private final MemberMapper memberMapper;
	
	@GetMapping("/mngr/member/excel") 
	public String memberList(MemberDto memberDto , Model model , HttpServletResponse response) {
		System.err.println(memberDto);
		System.err.println(memberDto.getSearchValue());
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("memberMapper", memberMapper);
		return "memberExcelView";
	}
    
    
} 
   