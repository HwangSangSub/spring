package com.yedam.app.security.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SampleController {
	@GetMapping("all")
	public void all() {} // end all
	
	@GetMapping("user")
	public void user() {} // end user
	
	@GetMapping("admin")
	public void admin() {} // end admin
	
}// end class
