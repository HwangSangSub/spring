package com.yedam.app.dept.web;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.dept.service.DeptService;
import com.yedam.app.dept.service.DeptVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
	// 서비스 주입
	private final DeptService deptService;
	
	// 전체조회
	@GetMapping("deptList")
	public String deptList(Model model) {
		List<DeptVO> list = deptService.deptList();
		
		model.addAttribute("depts", list);
		
		return "dept/list";
	}// end deptList
	
	// 단건조회 : Get
	@GetMapping("deptInfo")
	public String deptInfo(DeptVO deptVO, Model model) {
		DeptVO findVO = deptService.deptInfo(deptVO);
		model.addAttribute("dept", findVO);
		return "dept/info";
	}//end deptInfo
	
	// 등록 - 페이지 : GET
	@GetMapping("deptInsert")
	public String empInsertForm() {
		return "dept/insert";
	}// end empInsertForm
	
	// 등록 - 처리
	@PostMapping("deptInsert")
	public String deptInsertProcess(DeptVO deptVO) {
		int deptid = deptService.deptInser(deptVO);
		String url = null;
		if (deptid > -1) {
			url = "redirect:deptInfo?departmentId="+deptid;
		} else {
			url = "redirect:deptList";
		}
		return url;
	}// end deptInsertProcess
	
	// 수정 - 페이지
	@GetMapping("deptUpdate")
	public String deptUpdateForm(DeptVO deptVO, Model model) {
		DeptVO findVO = deptService.deptInfo(deptVO);
		model.addAttribute("dept", findVO);
		return "dept/update";
	}// end deptUpdateForm
	
	// 수정 - 처리 : JSON
	@PostMapping("deptUpdate")
	@ResponseBody
	public Map<String, Object> deptUpdateAJAXJSON(@RequestBody DeptVO deptVO) {
		return deptService.deptUpdate(deptVO);
	}// end deptUpdateAJAXJSON
	
	// 삭제 - 처리
	@GetMapping("deptDelete")
	public String deptDelete(Integer departmentId) {
		deptService.deptDelete(departmentId);
		return "redirect:deptList";
	}// end deptDelete
	
	
}// end class
