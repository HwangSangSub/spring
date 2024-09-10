package com.brighten.idi.config;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

//@Component
public class LoginFailHandler implements AuthenticationFailureHandler    {


	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.err.println("fail");
//        String requestedWithHeader = request.getHeader("X-Requested-With");
//        System.err.println("fail 핸들러 탓는가?");
//        System.err.println(requestedWithHeader);
//        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//        PrintWriter out = response.getWriter();
//        JSONObject data = new JSONObject(); 
//        System.err.println(exception.getMessage());
//        if (exception instanceof BadCredentialsException) {
//        	data.put("message", "접속정보가 잘못 되었습니다.");
//        } else if (exception instanceof InsufficientAuthenticationException) {
//        	data.put("message", "권한이 없습니다.");
//        }
//
//        data.put("code", HttpServletResponse.SC_BAD_REQUEST);
//
//        // Content-Type 헤더 설정
//        response.setContentType("application/json");
//
//        // JSON 데이터 응답으로 보내기
//        response.getWriter().write(data.toString());
		
		
		//위에만살림
		
//        if ("XMLHttpRequest".equals(requestedWithHeader)) {
//        	throw new ServletException();
//        	// Ajax 요청 처리
//        } else {
//            // Forward 요청 또는 일반적인 요청 처리
//        	System.err.println("세션 ㅂㅂ");
//        	response.sendRedirect("/login");
//        }
//		response.sendRedirect("/");		
//        String errorMessage = "Invalid Username or Password";
//
//        if (exception instanceof BadCredentialsException) {
//            errorMessage = "Invalid Username or Password";
//        } else if (exception instanceof InsufficientAuthenticationException) {
//            errorMessage = "Invalid Secret Key";
//        }
//
//        setDefaultFailureUrl("/login?error=true&exception=" + errorMessage);
//
//        super.onAuthenticationFailure(request, response, exception);
	}

}
