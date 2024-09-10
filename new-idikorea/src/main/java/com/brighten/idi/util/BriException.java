package com.brighten.idi.util;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class BriException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	private HttpStatus code;
	private int code1;

	public BriException(HttpStatus code){
		super();
		this.code = code;
	}

	public BriException(String message){
		super(message);
		this.code = HttpStatus.INTERNAL_SERVER_ERROR;
	}

	public BriException(HttpStatus code, String message){
		super(message);
		this.code = code;
		this.code1 = code.value();
	}
	
	public BriException(HttpStatus code, String message , int code1){
		super(message);
		this.code = code;
		this.code1 = code1;
	}
	
	public HttpStatus getHttpStatus() {
		return code;
	}

}