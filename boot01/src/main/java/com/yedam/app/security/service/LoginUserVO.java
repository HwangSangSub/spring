package com.yedam.app.security.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;

// 로그인한 정보를 받을 수 있다.
@Getter
// 세터가 필요없다.
public class LoginUserVO  implements UserDetails{
	// UserVO를 기반으로 한 생성자가 필요하다.
	private UserVO userVO;
	
	public LoginUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	// ? : 제네릭타입을 사용한다는 의미
	// Collection 상속하는 인터페이스 중에 원하는 스타일을 선택해서 처리 (반복되는 형태에 처리방법 중 최상위) > 쉽게 말하면 List타입 사용하면 된다.
	public Collection<? extends GrantedAuthority> getAuthorities() { 
		List<GrantedAuthority> auths = new ArrayList<>();
		auths.add(new SimpleGrantedAuthority(userVO.getRoleName()));
		return auths;
	}// end getAuthorities

	@Override
	public String getPassword() {
		return userVO.getPassword();
	}// end getPassword

	@Override
	public String getUsername() {
		return userVO.getLoginId();
	}// end getUsername

	// 계정만료여부
	@Override
	public boolean isAccountNonExpired() { 
		return true;
	}// end isAccountNonExpired

	// 계정잠금여부
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}// end isAccountNonLocked

	// 계정 패스워드 만료여부
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}// end isCredentialsNonExpired

	// 계정 활성화 여부
	@Override
	public boolean isEnabled() {
		return true;
	}// end isEnabled

}// end class
