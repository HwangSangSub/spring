package com.yedam.app.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
@Configuration
public class SpringSecurityConfig {
	@Bean // 비밀번호 암호화
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}// end passWordEncoder
	
	/*
	@Bean // 메모리상 인증정보 등록 => 테스트 전용
	InMemoryUserDetailsManager inMEmoryUserDetail() {
		// 일반회원
		UserDetails user = // 인증에 대해 처리하는 부분 (메모리에 USER에 대한 정보를 임시로 등록함) > 프로그램이 동작하는 동안 해당 회원이 있다고 가정하고 테스트함
				// 각 매개변수에 값에 정확하게 일치하는 값을 넣어주면 내부적으로 생성자를 통해 객체를 생성해준다.
				User.builder() // 구현하는 클래스 중에 User가 있고 디자인 패턴중에 하나이다
				.username("user1") // 계정
				.password(passwordEncoder().encode("1234")) // 비밀번호 암호화
				.roles("USER")//ROLE_USER // 권한
				//.authorities("ROLE_USER") // 권한
				.build(); // 생성
		
		// 관리자
		UserDetails admin = 
				User.builder() 
				.username("admin1")
				.password(passwordEncoder().encode("1234"))
				.authorities("ROLE_ADMIN", "ROLE_USER") // 동시에 권한을 부여할 수 있다.
				.build(); // 생성
		
		return new InMemoryUserDetailsManager(user, admin);
	}// end inMEmoryUserDetail
	*/
	//인증 및 인가
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		// 적용될 Security 설정
		//  => URI에 적용될 권한 (가장 중요한거 : 어떤 URI를 사용할지와 해당 URI에 어떤 권한을 줄지)
		// 람다식으로 사용된다. (쉽게 말하면 화살표 함수) => 스프링 시큐리티에서는 아주 적극적으로 사용한다)
		http
			.authorizeHttpRequests( authrize 
					-> authrize
					.requestMatchers("/", "/all")// 경로 : 등록할 수 있는 여러가지 경로
					.permitAll()// 권한 부여 (permitAll : 권한체크를 아예 안함 모든 접속허용) > 보통 메인페이지나 우리 홈페이지를 소개하는 쪽에서 사용함
					.requestMatchers("/user/**").hasAnyRole("USER", "ADMIN") // hasRole 은 1건 , hasAnyRole 에서 쉼표로 구분하면 여러개의 권한을 확인해서 부여한다.
					.requestMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
					.anyRequest().authenticated()// 위에 정의된 부분을 제외한 나머지 들을 일괄처리 한다.// 권한상관없이 인증만 받은 모든 사용자 (나머지 부분에서는 인증을 받아야한다)
			)// 권한설정
			.formLogin(formlogin -> formlogin
					.defaultSuccessUrl("/all")) // 로그인 성공 시 이동할 기본 페이지(리다이렉트 경로)
			.logout(logout -> logout
					.logoutSuccessUrl("/login")
					.invalidateHttpSession(true)) // 로그아웃이 성공할 경우 이동할 페이지(자동완성에 아이콘에 사선이 있으면 그방식을 사용하지 말라는 의미) > 로그아웃에서는 무조건 커스텀마이징을 하라는 의미
			;

		// 일시적으로 csrf를 사용하지 않겠다 > 절대로 운영할때는 사용하면 안된다.
		// 개발 및 테스트 할때만 csrf를 잠시 꺼두고 하고 완료한 후 일괄적용하면 된다.
		http.csrf(csrf -> csrf.disable());
		return http.build();
	}// end filterChain

}// end class

