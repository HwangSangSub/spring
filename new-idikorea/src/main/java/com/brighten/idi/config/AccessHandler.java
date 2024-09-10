package com.brighten.idi.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import com.brighten.idi.util.SessionUtil;

@Component
public class AccessHandler implements AccessDeniedHandler{

	@Override
	public void handle(
			HttpServletRequest request,
			HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
        String requestedWithHeader = request.getHeader("X-Requested-With");
        System.err.println("access 핸들러 탓는가?");
        try {
			System.err.println(SessionUtil.getId());
			System.err.println(SessionUtil.getRole());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if ("XMLHttpRequest".equals(requestedWithHeader)) {
        	response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied!");
        	// Ajax 요청 처리
        } else {
            // Forward 요청 또는 일반적인 요청 처리
        	System.err.println("세션 ㅂㅂ");
//        	response.sendRedirect("/login");
        }
	}
 
}
