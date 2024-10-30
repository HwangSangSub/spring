package com.yedam.app.board.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
//@Builder // 기본생성자를 삭제하는것 때문 기본 new 연산자를 사용할 수 없다.
public class BoardVO {
	private Integer bno; // 게시글번호
	private String title; // 제목
	private String contents; // 내용
	private String writer; // 작성자 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate; // 작성일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedate; // 수정일
	private String image; // 이미지
}// end class
