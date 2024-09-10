package com.brighten.idi.util;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "기본 응답")
public class BriResponse<T> extends ResponseEntity<T> {

	public BriResponse(HttpStatus status) {
		super(status);
	}

	public BriResponse() {
		super(HttpStatus.OK);
	}

	public BriResponse(T body) {
		super(body, HttpStatus.OK);
	}

	public BriResponse(T body, HttpStatus status) {
		super(body, status);
	}
}
