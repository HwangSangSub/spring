package com.brighten.idi.util.exception;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class ErrorAttribute {
//	HttpStatus code;
	int code;
	String message;
	String fieldName;
}
