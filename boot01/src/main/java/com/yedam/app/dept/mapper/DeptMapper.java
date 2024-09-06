package com.yedam.app.dept.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.dept.service.DeptVO;

public interface DeptMapper {
	// 전체 부서정보 조회
	public List<DeptVO> selectDeptAll();
	
	// 부서정보 단건 조회
	public DeptVO selectDeptInfo(DeptVO deptVO);
	
	// 부서정보 단건 등록
	public int insertDeptInfo(DeptVO deptVO);
	
	// 부서정보 단건 수정
	public int updateDeptInfo(@Param("deptid") int deptId, @Param("dept") DeptVO deptVO);
	
	// 부서정도 단건 삭제
	public int deleteDeptInfo(int deptId);
}//end class
