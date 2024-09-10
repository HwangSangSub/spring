package com.yedam.app;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.service.BoardVO;

@SpringBootTest
class BootBoardApplicationTests {
	@Autowired // 필드 주입
	private BoardMapper boardMapper;
	
	@Test
	void boardInsert() {
		BoardVO boardVO = BoardVO.builder()
					.title("First board3")
					.writer("Tester3")
					.regdate(new Date())
					.build();
		int result = boardMapper.insertBoardInfo(boardVO);
		assertEquals(result, 1);
	}// end boardInsert

	/*
	// 등록테스트
	@Test
	void insertBoardInfo() {
		// 등록 : 대상 - bno, title, contents, writer, regdate, image
		//  				-> 출력, 1
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("제목테스트2");
		boardVO.setContents("내용테스트2");
		boardVO.setWriter("작성자2");
		boardVO.setImage("abc.jpg");
		
		int result = boardMapper.insertBoardInfo(boardVO);
		assertEquals(result, 1);
	}
 	*/
	/*
	// 전체조회 테스트
	@Test
	void boardList() {
		List<BoardVO> list = boardMapper.selectBoardAll();
		assertTrue(!list.isEmpty());
	}
 	*/
	/*
	// 단건조회 테스트
	@Test
	void boardInfo() {
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(1001);
		BoardVO findVO = boardMapper.selectBoardInfo(boardVO);
		assertEquals(findVO.getWriter(), "작성자");
	}
 	*/
	/*
	// 수정 테스트
	@Test
	void updateBoardInfo() {
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(1001);
		boardVO.setTitle("제목제목테스트");
		boardVO.setContents("내용내용테스트");
		boardVO.setWriter("작성작성자");
		boardVO.setImage("aaaaa.jpg");
		
		int result = boardMapper.updateBoardInfo(boardVO);
		assertEquals(result, 1);
	}
	*/
	/*
	// 삭제 테스트
	@Test
	void deleteBoardInfo() {
		int result = boardMapper.deleteBoardInfo(1001);
		assertEquals(result, 1);
	}
	*/
}// end class
