package com.brighten.idi.login;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brighten.idi.util.BriException;
import com.brighten.idi.util.BriResponse;
import com.brighten.idi.util.SessionUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
@Controller
@RequiredArgsConstructor
public class LoginApiController {

	private final AuthenticationManager authenticationManager ;
	
	@ResponseBody
	@PostMapping("/api/v1/login")
	public BriResponse<Map<String,Object>> intro(@RequestParam("username") String username , @RequestParam("password") String password , HttpServletRequest req) throws Exception{
		System.err.println(username);
		System.err.println(password);
		//try {
			UsernamePasswordAuthenticationToken token =
					new UsernamePasswordAuthenticationToken(username, password);
			Authentication authentication=authenticationManager.authenticate(token);
			SecurityContextHolder.getContext().setAuthentication(authentication);
			//UserDetails principal = (UserDetails) authentication.getPrincipal();
			System.err.println(SessionUtil.getRole());
			if(SessionUtil.getRole().equals("관리자")) { 
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("result", "관리자"); 
				System.err.println("로그인");
				return new BriResponse<Map<String,Object>>(map,HttpStatus.OK);  
				 
			}else
				throw new BriException(HttpStatus.BAD_REQUEST,"관리자가 아닙니다.");
//		}catch (BadCredentialsException e) {
//			Map<String,Object> map = new HashMap<String,Object>();
//			map.put("message", "잘못된 로그인 정보.");
//			map.put("code", "403");
//			return new BriResponse<Map<String,Object>>(map,HttpStatus.FORBIDDEN);
////			throw new BriException(HttpStatus.BAD_REQUEST,"잘못된 로그인 정보.");
//			//            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("잘못된 로그인 정보");
//		}
//		catch (DisabledException e) {
//			throw new BriException(HttpStatus.BAD_REQUEST,"계정 비활성화됨.");
////            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("계정 비활성화됨");
//        } 
//		catch (SessionAuthenticationException e) {
//        	throw new BriException(HttpStatus.BAD_REQUEST,"이미 로그인 되어 있음.");
//        	//            return ResponseEntity.status(HttpStatus.CONFLICT).body("이미 로그인 되어 있음");
//        } catch (AuthenticationException e) {
//        	throw new BriException(HttpStatus.BAD_REQUEST,"인증 실패: 기타 오류.");
//        	//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인증 실패: 기타 오류");
//        }
		
	}
	
//	public boolean logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
//	    if (authentication != null) {
//	        new SecurityContextLogoutHandler().logout(request, response, authentication);
//	    }
//	    return true;
//	}

	
	@GetMapping("/api/v1/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws Exception{
	    if (authentication != null) {
	        new SecurityContextLogoutHandler().logout(request, response, authentication);
	    }
	    if(request.getHeader("Referer").contains("mngr")) 
	    	response.sendRedirect("/mngr/login/index");
	    else 
	    	response.sendRedirect("/user/main");
//	    	response.sendRedirect(request.getHeader("Referer"));
	    
	}
}
