package com.yedam.app.board.service.impl;

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
		map.put("result", isSuccessed);
		map.put("target", boardVO);
		return map;
	}// end boardUpdate

	@Override
	public Map<String, Object> boardDelete(int bno) {
		Map<String, Object> map = new HashMap<>();
		
		int result = boardMapper.deleteBoardInfo(bno);
		
		if(result == 1) {
			map.put("bno", bno);
		}
		
		return map;
	} // end boardDelete
	
}// end class
