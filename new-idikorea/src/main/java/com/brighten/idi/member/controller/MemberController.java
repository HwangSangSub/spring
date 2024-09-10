package com.brighten.idi.member.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.mapper.MemberMapper;
import com.brighten.idi.member.service.MemberService;
import com.brighten.idi.test.TestMapper;
import com.brighten.idi.util.BriPage;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@RestController
@RequiredArgsConstructor
public class MemberController {

	private final TestMapper test;

	private final MemberService memberService;
	
	private final MemberMapper memberMapper;

	@GetMapping("/api/v1/mngr/member")
	public BriPage<MemberDto> member(MemberDto memberDto) throws Exception{
		System.err.println("=====================");
		return memberService.memberList(memberDto);
	} 
	
	@GetMapping("/api/v1/mngr/member/{memberNo}")
	public MemberDto member(@PathVariable(name="memberNo") Integer memberNo) throws Exception{
		System.err.println(memberNo);
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberNo(memberNo);
		return memberService.member(memberDto);
	} 
	
	 
	@GetMapping("/api/v1/mngr/member1")
	public boolean member1(MemberDto memberDto) throws Exception{
		Map<String,Object> map =new HashMap<String,Object>();
		return test.newGrpInsert(map);
	} 
	 
	
	@PutMapping("/api/v1/mngr/member")
	public boolean updateMember(@RequestBody MemberDto memberDto) throws Exception{
		System.err.println("!!!!!!!!!!!!!!!!");
		return memberMapper.updateMember(memberDto);
	}
	
    
    
} 
   