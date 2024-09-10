package com.brighten.idi.emoney.controller;


import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.brighten.idi.emoney.dto.EmoneyDto;
import com.brighten.idi.emoney.mapper.EmoneyMapper;
import com.brighten.idi.member.dto.MemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@RestController
@RequiredArgsConstructor
public class EmoneyController {

	private final EmoneyMapper emoneyMapper;
	
	@GetMapping("/api/v1/mngr/member/{memberNo}/emoney")
	public List<EmoneyDto> emoney(@PathVariable(value="memberNo") Integer memberNo,MemberDto memberDto) throws Exception{
		System.err.println(memberDto);
		System.err.println(memberDto.getPageNum());
		return emoneyMapper.emoneyList(memberDto);
//		return null;
	}
	
    
    
} 
    