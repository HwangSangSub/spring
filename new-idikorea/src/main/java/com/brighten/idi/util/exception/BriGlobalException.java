package com.brighten.idi.util.exception;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.UnexpectedTypeException;

import org.springframework.http.HttpStatus;
import org.springframework.lang.Nullable;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Component;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.brighten.idi.util.BriException;
import com.brighten.idi.util.BriResponse;

import lombok.RequiredArgsConstructor;

@Component
@RestControllerAdvice
@RequiredArgsConstructor
public class BriGlobalException {
	
	@ExceptionHandler(BriException.class)
	protected BriResponse<ErrorAttribute> handleBindException(
//			UnexpectedTypeException unexpectedTypeException,
			BriException briException,
			HttpServletRequest request,
			HttpServletResponse response,
			@Nullable Object handler) throws IOException {
//		FieldError fieldError = unexpectedTypeException.getFieldError();
//		exceptionService.register(fieldError);
		System.err.println("???");
		ErrorAttribute err = ErrorAttribute.builder()
				.code(400)
				.message(briException.getMessage())
			//	.fieldName(fieldError.getField())
				.build();
		return new BriResponse<>(err, briException.getCode());
	}
	
	@ExceptionHandler(BadCredentialsException.class)
	protected BriResponse<ErrorAttribute> loginFail(
//			UnexpectedTypeException unexpectedTypeException,
			BadCredentialsException exception,
			HttpServletRequest request,
			HttpServletResponse response,
			@Nullable Object handler) throws IOException {
//		FieldError fieldError = unexpectedTypeException.getFieldError();
//		exceptionService.register(fieldError);
		System.err.println("???");
		ErrorAttribute err = ErrorAttribute.builder()
				.code(400)
				.message("잘못적엇네 ㅎㅎ")
				//	.fieldName(fieldError.getField())
				.build();
		return new BriResponse<>(err, HttpStatus.BAD_REQUEST);
	}

//	@ExceptionHandler(BindException.class)
//	protected BriResponse<ErrorAttribute> handleBindException(
//			BindException bindException,
//			HttpServletRequest request,
//			HttpServletResponse response,
//			@Nullable Object handler) throws IOException {
//		FieldError fieldError = bindException.getFieldError();
//		exceptionService.register(fieldError);
//		ErrorAttribute err = ErrorAttribute.builder()
//				.code(903)
//				.message(fieldError.getField()+"값이 잘못되었습니다.")
//				.fieldName(fieldError.getField())
//				.build();
//		return new BriResponse<>(err, HttpStatus.BAD_REQUEST);
//	}
//
//	@ExceptionHandler(BriException.class)
//	protected BriResponse<ErrorAttribute> handleBriException(
//			BriException briException,
//			HttpServletRequest request,
//			HttpServletResponse response,
//			@Nullable Object handler) throws IOException {
//		
//		exceptionService.register(briException);
//		System.err.println("errrrrrrrrr");
//		ErrorAttribute err = ErrorAttribute.builder()
//				.code(briException.getCode1())
//				.message(briException.getMessage())
//				.build();
//		return new BriResponse<>(err, briException.getHttpStatus());
//	}
}
