package com.yedam.app.board.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;

@Service // AOP => @Transactional
public class BoardServiceImpl implements BoardService{
	private BoardMapper boardMapper;
	
	@Autowired
	BoardServiceImpl(BoardMapper boardMapper){
		this.boardMapper = boardMapper;
	}
	
	@Override
	public List<BoardVO> boardList() {
		return boardMapper.selectBoardAll();
	}// end boardList

	@Override
	public BoardVO boardInfo(BoardVO boardVO) {
		return boardMapper.selectBoardInfo(boardVO);
	}// end boardInfo

	@Override
	public int boardInsert(BoardVO boardVO) {
		int result = boardMapper.insertBoardInfo(boardVO);
		
		return result == 1 ? boardVO.getBno() : -1;
	}// end boardInser

	@Override
	public Map<String, Object> boardUpdate(BoardVO boardVO) {
		Map<String, Object> map = new HashMap<>();
		
		boolean isSuccessed = false;
		
		int result = boardMapper.updateBoardInfo(boardVO);
		
		if(result == 1) {
			isSuccessed = true;
		}
		
		String updateDate = getUpdateDate(); // 내부 메소드를 사용
		
		map.put("date", updateDate);
		map.put("result", isSuccessed);
		map.put("target", boardVO);
		return map;
	}// end boardUpdate
	
	// 내부적인 메소드
	private String getUpdateDate() {
		// 날짜를 다루는 클래스 > now() : 현재 시점
		// format 때문에 사용한다.
		LocalDate today = LocalDate.now();  
		String updateDt = today.format(DateTimeFormatter.ofPattern("yyyy/MM/dd")); // 자신이 가지고 있는 날짜에 대해선 출력하고자 하는 포멧을 결정하는것.
		return updateDt;
		// return LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
	}

	@Override
	public int boardDelete(int bno) {
		return boardMapper.deleteBoardInfo(bno);
	} // end boardDelete
	
}// end class
