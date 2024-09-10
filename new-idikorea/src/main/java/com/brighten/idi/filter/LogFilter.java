package com.brighten.idi.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

@Order(0)
@Component
public class LogFilter extends GenericFilterBean {

//	@Autowired
//	OldCafeService cafeService;

//	@Autowired
//	OldCafeMapper cafeMapper;

	
	@Override
	public void doFilter(ServletRequest request, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
//		System.err.println("필터 in");
		filterChain.doFilter(request, servletResponse);
	}

}
 