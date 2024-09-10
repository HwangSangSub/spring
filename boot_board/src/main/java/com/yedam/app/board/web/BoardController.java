package com.yedam.app.board.web;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
	private final BoardService boardService;
	
	// 전체조회
	@GetMapping("boardList")
	public String empList(Model model) {
		List<BoardVO> list = boardService.boardList();
		model.addAttribute("boards", list);
		return "board/list";
	}// end empList
	
	// 단건조회
	@GetMapping("boardInfo")
	public String boardInfo(BoardVO boardVO, Model model) {
		BoardVO findVO = boardService.boardInfo(boardVO);
		model.addAttribute("board", findVO);
		return "board/info";
	}// end boardInfo
	
	// 등록 - 페이지
	@GetMapping("boardInsert")
	public String boardInsertForm() {
		return "board/insert";
	}// end boardInsertForm
	
	// 등록 - 처리
	@PostMapping("boardInsert")
	public String boardInsertProcess(BoardVO boardVO) {
		int bno = boardService.boardInsert(boardVO);
		String url = null;
		if(bno > -1) {
			url = "redirect:boardInfo?bno="+bno;
		} else {
			url = "redirect:boardList";
		}
		return url;
	}// end boardInsertProcess
	
	// 수정 - 페이지
	@GetMapping("boardUpdate")
	public String boardUpdateForm() {
		return "board/update";
	}// end boardUpdateForm
	
	// 수정 - 처리
	@PostMapping("boardUpdate")
	@ResponseBody
	public Map<String, Object> boardUpdateAJAXJSON(@RequestBody BoardVO boardVO) {
		return boardService.boardUpdate(boardVO);
	}// end boardUpdateAJAXJSON
	
	// 삭제 - 처리
	@GetMapping("boardDelete")
	public String boardDelete(Integer bno) {
		boardService.boardDelete(bno);
		return "redirect:boardList";
	}// end boardDelete
	
}// end class
