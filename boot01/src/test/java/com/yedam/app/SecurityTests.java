package com.yedam.app;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

// 회원가입 담당하는사람이 필수로 해야함
@SpringBootTest
public class SecurityTests {
	@Autowired
	// 패스워드 암호화
	PasswordEncoder passwordEncoder;
	
	@Test
	void pwdEconderTest() {
		String password = "1234";
		String chkPwd = "1111";
		// encode : DB에 저장된 비밀번호 => 암호화 작업
		String enPwd = passwordEncoder.encode(password); // 암호화 하는 방법 > 단방향이라 복호화가 안된다/
		System.out.println(enPwd);  // $2a$10$CAaGM3452B1WPpNOyA1yUeYMcU1zHvdkScvJys6JZ2DgB/cnQPItG : 64글자가 나옴.
		
		// matches : 암호화된 비밀번호와 입력된 비밀번호를 서로 비교할때 사용함.
		boolean result = passwordEncoder.matches(chkPwd, enPwd); // 64비트
		System.out.println(result);
	}
}// end class
