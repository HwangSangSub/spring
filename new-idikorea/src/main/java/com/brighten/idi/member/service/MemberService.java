package com.brighten.idi.member.service;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.util.BriPage;

public interface MemberService {

	public BriPage<MemberDto> memberList(MemberDto memberDto) throws Exception;
	
	public MemberDto member(MemberDto memberDto ) throws Exception;
	
}
