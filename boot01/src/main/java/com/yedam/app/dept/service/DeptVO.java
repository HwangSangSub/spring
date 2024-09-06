package com.yedam.app.dept.service;

import lombok.Data;

@Data
public class DeptVO {
	private Integer departmentId; // 부서번호, 기본키, NOT NULL
	private String departmentName; // 부서명, NOT NULL
	private Integer managerId; // 부서책임자, FK
	private Integer locationId; // 지역번호, FK
}// end class
