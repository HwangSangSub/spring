package com.yedam.app.security.mapper;

import com.yedam.app.security.service.UserVO;

public interface UserMapper {
	// 유저정보 조회
	public UserVO getUserInfo(String username);

}// end interface
