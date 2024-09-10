package com.yedam.app.security.service;

import lombok.Data;

@Data
public class UserVO {
	private String loginId; // 계정
	private String password; // 비밀번호
	private String roleName; // 롤이름
}// end class
