package com.brighten.idi.util;

import java.io.Serializable;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.brighten.idi.module.auth.service.UserDetailsImpl;


public class SessionUtil implements Serializable {
	
	public static boolean isLogin() throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal());
	}

	public static String getId() throws Exception {
		UserDetailsImpl user = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return user.getUsername().toString();
	}

	public static String getRole() throws Exception {
		UserDetailsImpl user = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return user.getRole();
	}
	
	public static Integer getMemberNo() throws Exception {
		UserDetailsImpl user = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return user.getMemberNo();
	}
	
	public static String getPassword() throws Exception {
		UserDetailsImpl user = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return user.getPassword();
	}

	//
//	public static Long getChurchId() throws Exception {
//		UserDto user = (UserDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		return user.getChurchId();
//	}
//	
//	public static String getRole() throws Exception {
//		UserDto user = (UserDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		return user.getRole();
//	}
//	
//	public static void set(String key, String value) throws Exception {
//		UserDto principal = (UserDto)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		Map<String,String> map = new HashMap<>();
//		map.put(key, value);		
//		principal.setAttr(map);
//	}
//	
//	public static UserDto getUser() throws Exception {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		UserDto user = ((UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
//		return user;
//	}
	

}
