package com.brighten.idi.module.auth.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class UserDetailsImpl  implements UserDetails,  Serializable{

	private static final long serialVersionUID = 1L;

	String username;

	Integer memberNo;
	
	String password;

	String email;
	
	String role;
		
	String di;
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<>();
		collect.add(new GrantedAuthority() {
			private static final long serialVersionUID = 1L;
			@Override
			public String getAuthority() {
				return "ROLE_"+role;
			}
		});
		return collect;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
