package com.yedam.app.security.service.impl;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.yedam.app.security.mapper.UserMapper;
import com.yedam.app.security.service.LoginUserVO;
import com.yedam.app.security.service.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // final 이랑은 한 세트로 움직인다.
public class CustomerUserDetailsService implements UserDetailsService {
	// Mapper를 활용해서 DB에 접근
	private final UserMapper userMapper; // @RequiredArgsConstructor이기 때문에 필드에 final이 붙어야 한다.

	// 인증을 진행할때 사용하는 메소드
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// 유저정보를 가져온다.
		UserVO userVO = userMapper.getUserInfo(username);
		
		// 쿼리가 정상적으로 실행 된 후 결과가 없을 경우에는 예외처리
		if(userVO == null) {
			throw new UsernameNotFoundException(username);
		}// end if
		
		// 실제로 있다면 userVO를 값을 바로 쓰지 않는다 리턴할때는 UserDetails 이라는 인터페이스로 반환한다.
		// 시큐리티가 사용하는 VO와 우리가 사용하는 VO와 별개도 한다.
		// 시큐리티가 원하는 형태는 그대로 사용하되 우리가 원하는 VO를 각각 만드는 방식을 선호한다
		return new LoginUserVO(userVO);
	}// end loadUserByUsername

}// end class
