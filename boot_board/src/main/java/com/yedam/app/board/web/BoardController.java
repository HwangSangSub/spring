package com.yedam.app.board.web;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
	private final BoardService boardService;
	
	 // 전체조회 : URI - boardList / RETURN - board/boardList
	@GetMapping("boardList")
	public String empList(Model model) {
		List<BoardVO> list = boardService.boardList();
		model.addAttribute("boards", list);
		return "board/boardList";
	}// end empList
	
	// 단건조회 : URI - boardInfo / PARAMETER - BoardVO(QueryString)
    //          RETURN - board/boardInfo
	// QueryString
	// 1) 객체 : 커맨드 객체
	// 2) 단일값 : @ReqeustParam
	@GetMapping("boardInfo")
	public String boardInfo(BoardVO boardVO, Model model) {
		BoardVO findVO = boardService.boardInfo(boardVO);
		model.addAttribute("board", findVO);
		return "board/boardInfo";
	}// end boardInfo
	
	// 등록 - 페이지 : URI - boardInsert / RETURN - board/boardInsert
	@GetMapping("boardInsert")
	public String boardInsertForm() {
		return "board/boardInsert";
	}// end boardInsertForm
	
	// 등록 - 처리 : URI - boardInsert / PARAMETER - BoardVO(QueryString)
    //             RETURN - 단건조회 다시 호출
	@PostMapping("boardInsert")
	public String boardInsertProcess(BoardVO boardVO) { // <form /> 활용한 커맨드 객체
		int bno = boardService.boardInsert(boardVO);
		return "redirect:boardInfo?bno="+bno;
	}// end boardInsertProcess
	
	// 삭제 - 처리 : URI - boardDelete / PARAMETER - Integer
    //             RETURN - 전체조회 다시 호출
	@GetMapping("boardDelete") // QueryString : 단일값은 @RequestParam
	public String boardDelete(@RequestParam Integer bno) {
		boardService.boardDelete(bno);
		return "redirect:boardList";
	}// end boardDelete
	
	// 수정 - 페이지 : URI - boardUpdate / PARAMETER - BoardVO(QueryString)
    //               RETURN - board/boardUpdate
	@GetMapping("boardUpdate")
	public String boardUpdateForm(BoardVO boardVO, Model model) {
		BoardVO findVO = boardService.boardInfo(boardVO);;
		model.addAttribute("board", findVO);
		return "board/boardUpdate";
	}// end boardUpdateForm
	
	// 수정 - 처리 : URI - boardUpdate / PARAMETER - BoardVO(JSON)
    //             RETURN - 수정결과 데이터(Map)
	@PostMapping("boardUpdate")
	@ResponseBody
	public Map<String, Object> boardUpdateAJAXJSON(@RequestBody BoardVO boardVO) {
		return boardService.boardUpdate(boardVO);
	}// end boardUpdateAJAXJSON
	
}// end class
