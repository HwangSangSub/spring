package com.brighten.idi.module.auth.service;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.mapper.MemberMapper;
import com.google.api.client.util.Value;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements UserDetailsService {

	private final MemberMapper memberMapper;

	@Value("${auth.permitId}")
	private String permitIds;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto inDto = new MemberDto();
		inDto.setMemberId(username);
		MemberDto memberDto=memberMapper.member(inDto);
		UserDetailsImpl userDetails = new UserDetailsImpl(); 
//		System.err.println(dbManager.getId());
		//System.err.println(dbManager.getEmail()); 
		//System.err.println(dbManager.getChurch().getId());
		System.err.println("??????????");
		if(memberDto==null)
			throw new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다.: " + username);
		userDetails.setUsername(username);
		userDetails.setPassword(memberDto.getPassword());
		userDetails.setRole(memberDto.getGroupName());
		userDetails.setMemberNo(memberDto.getMemberNo());
		return userDetails; 
	}
	

}
