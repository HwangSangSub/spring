package com.brighten.idi.member.service;

import org.springframework.stereotype.Service;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.mapper.MemberMapper;
import com.brighten.idi.util.BriPage;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@Tag(name = "멤버")
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;

	@Override
	public BriPage<MemberDto> memberList(MemberDto memberDto) throws Exception {
		return new BriPage<MemberDto>(memberMapper.memberList(memberDto),memberDto,memberMapper.memberListCnt(memberDto));
	}

	@Override
	public MemberDto member(MemberDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		return memberMapper.member(memberDto);
	}


}
