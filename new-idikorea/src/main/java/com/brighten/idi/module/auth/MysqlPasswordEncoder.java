package com.brighten.idi.module.auth;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.brighten.idi.member.mapper.MemberMapper;

public class MysqlPasswordEncoder implements PasswordEncoder {
	
	private final MemberMapper memberMapper;  

    @Autowired // 이 생성자를 통해 의존성 주입
    public MysqlPasswordEncoder(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }
    
    @Override
    public String encode(CharSequence rawPassword) {
        // MySQL PASSWORD() 함수의 알고리즘에 따라 rawPassword를 해시하는 로직 구현
        // 여기서는 예시로 단순화된 버전을 사용합니다. 실제 구현은 MySQL 문서와 알고리즘을 참조해야 합니다.
        return memberMapper.passwordEncode(rawPassword);
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        // 데이터베이스에 저장된 해시(encodePassword)와 사용자가 입력한 비밀번호(rawPassword)를 비교
		Map<String,Object> map = new HashMap<String,Object>();
		System.err.println("111111111111");
		System.err.println(rawPassword);
		System.err.println(encodedPassword);
		map.put("rawPassword", rawPassword);
		map.put("encodedPassword", encodedPassword);
		return memberMapper.passwordMatch(map);
    }


}
 