package com.yedam.app.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer{
	// 다른 인터페이스와 다르게 실행명령블록이 존재한다 그리고 default메소드로 선언되어있다.
	// 인터페이스는 기본적으로 추상메소드(명령블록이 없는)게 존재한다.
	@Value("${file.upload.path}") // 메모리에 올라가 있는 변수값을 가져오기 때문에 표현이 다름
	private String uploadPath;
	
	// 리소스 핸들링
	// src/main/resources 말고 다른 경로를 지정하고 싶을때, PC까지 범위로 확장할때 사용
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// registry : 경로를 처리하는 애
		// 2개가 한쌍 Handler이 1번째, Locations 2번째
		registry
			.addResourceHandler("imgs/**") // URL : 접근하는 경로 // static 밑에 있는 폴더명이랑 겹치면 오작동을 일으킬 수 있다.
			.addResourceLocations("file:///" + uploadPath );  // 실제 경로 : 물리적 위치
	}
	
	
}// end class
