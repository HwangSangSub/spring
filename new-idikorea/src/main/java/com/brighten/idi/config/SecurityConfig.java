package com.brighten.idi.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import com.brighten.idi.member.mapper.MemberMapper;
import com.brighten.idi.module.auth.MysqlPasswordEncoder;

import lombok.RequiredArgsConstructor;

@SuppressWarnings("deprecation")
@Configuration		//빈등록
@EnableWebSecurity	//시큐리티 필터 추가
@EnableGlobalMethodSecurity(prePostEnabled = true)	//특정 주소로 접근을 하면 권한 및 인증을 미리 체크하겠다는 뜻.
@RequiredArgsConstructor
public class SecurityConfig {
    
	@Autowired
    private MemberMapper memberMapper;
	
	private final AuthenticationConfiguration authenticationConfiguration;
    
	@Bean
	public AuthenticationFailureHandler customFailureHandler() {
		return new LoginFailHandler();
	}
	
	@Bean
	public AccessDeniedHandler accessHandler() {
		return new AccessHandler();
	}

//    @Bean
//    public AuthenticationManager authenticationManagerBean() throws Exception {
//        return super.authenticationManagerBean();
//    } 
    
    @Bean
    public AuthenticationManager authenticationManager () throws Exception {
    	return authenticationConfiguration.getAuthenticationManager();
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new MysqlPasswordEncoder(memberMapper);
    }
    
    @Bean
    public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
        DefaultHttpFirewall firewall = new DefaultHttpFirewall();
        firewall.setAllowUrlEncodedSlash(true); // URL 인코딩된 슬래시를 허용
        return firewall;
    }
    
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http 
				.csrf().disable() 
		        .authorizeRequests() 
		            .antMatchers("/api/v1/mngr/**").hasAnyRole("관리자") 
		            .antMatchers("/mngr/**").hasAnyRole("관리자") 
		            .antMatchers("/**").permitAll()
		            .anyRequest().authenticated()
		            .and()
		        .formLogin()
					.failureHandler(customFailureHandler())
		            .loginPage("/mngr/login/index")  // 사용자 정의 로그인 페이지를 지정합니다.
//					.loginProcessingUrl("/api/v1/login")
		            .permitAll()
		            .and()
		        .logout()
			        .logoutSuccessUrl("/mngr/login/index")
			        .logoutUrl("/logout")//디폴트가 logout 라 그대로 쓸거면 생략가능
			        .invalidateHttpSession(true) // 로그아웃시 세션만료
			        .deleteCookies("JESSIONID") //쿠키제거
			        .permitAll()
				.and()				
				.exceptionHandling()
				//.accessDeniedPage("/login")
				.accessDeniedHandler(new AccessHandler());
		return http.build();
	}// 


}
