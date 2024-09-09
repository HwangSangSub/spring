package com.yedam.app.aop.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.yedam.app.emp.service.EmpVO;

import lombok.extern.slf4j.Slf4j;


@Aspect // 실제 AOP와 관련된 설정을 들고 있는 클래스를 의미함.
@Component
@Slf4j // lombok이 가지고 있는 어노테이션이며 log와 연결하는 Bean
public class CommonAspect {
	// 포인트컷 : 조인포인트(@Service의 메소드들) 중에서 Advice(횡단관심, 부가기능)이 적용될 메소드 조건
	//@Pointcut("within(com.yedam.app.emp.service.impl.*)") // () 경로 안에 ~
	@Pointcut("within(com.yedam.app..service.impl.*)") 
	// 위의 어노테이션에 들고 있는 정보를 밑에 있는 메서드에 넣어서 사용한다
	public void empPointCut() { }// end empPointCut 
	
	// Weaving : 포인트컷 + 동작시점 + Advice
	// (포인트컷)이 동작하기 전에 하겠다는 의미
	/*
	@Before("empPointCut()")
	public void beforeAdvice(JoinPoint joinPoint) { // JoinPoint : 현재 포인트컷에 걸린 대상을 의미 함. 
		// Advice를 구현
		String sinagerStr = joinPoint.getSignature().toString();
		Object[] args = joinPoint.getArgs();
		log.error("####### 실행 : " + sinagerStr); // error로 하는 이유는 중간에 빨간색 글씨로 나오기 때문에
		for(Object arg : args) {
			log.error("매개변수 ", arg);
			if(arg instanceof Integer) {
				System.err.println((Integer)arg);
			} else if(arg instanceof EmpVO) {
				System.err.println((EmpVO)arg);
			}
		}
	}// end beforeAdvice
	*/

	// (포인트컷)이 동작한 후에 하겠다는 의미
	/*
	@After("empPointCut()")
	public void afterAdvice(JoinPoint joinPoint) { // JoinPoint : 현재 포인트컷에 걸린 대상을 의미 함. 
		// Advice를 구현
		String sinagerStr = joinPoint.getSignature().toString();
		Object[] args = joinPoint.getArgs();
		log.error("####### 실행 : " + sinagerStr); // error로 하는 이유는 중간에 빨간색 글씨로 나오기 때문에
		for(Object arg : args) {
			log.error("매개변수 ", arg);
			if(arg instanceof Integer) {
				System.err.println((Integer)arg);
			} else if(arg instanceof EmpVO) {
				System.err.println((EmpVO)arg);
			}
		}
	}// end afterAdvice
	*/
	
	@Around("empPointCut()")
	public Object executeTime(ProceedingJoinPoint joinPoint) throws Throwable {
		// Advice를 구현
		String signaterStr = joinPoint.getSignature().toString();
		System.out.println("=== 시작 : " + signaterStr);
		
		// 공통기능
		System.out.println("=== 핵심 기능 전 실행 : "+ System.currentTimeMillis());
		try {
			// 비즈니스 메소드를 실행
			Object obj = joinPoint.proceed(); // JoinPoint : 현재 포인트컷에 걸린 대상을 의미하고 이때 실행을 하겠다고 명시함 Around 에만 있는 메서드
			return obj;
		} finally { // 무조건 실행을 보장하는 코드를 넣을때 사용하는 구문
			//공통기능
			System.out.println("=== 핵심 기능 후 실행 : "+ System.currentTimeMillis());
			System.out.println("=== 끝 : " + signaterStr);
		}
	}// end executeTime
	
}// end class
