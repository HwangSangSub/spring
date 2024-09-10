package com.brighten.idi.member.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.brighten.idi.enumerate.BirthType;
import com.brighten.idi.enumerate.GenderType;
import com.brighten.idi.enumerate.YesNo;
import com.brighten.idi.member.group.dto.MemberGroupDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class MemberDto extends MemberGroupDto{
	
	@Schema(description = "회원번호")
	Integer memberNo;

	@Schema(description = "회원아이디")
	String memberId;
	
	@Schema(description = "회원이름")
	String memberName;
	
	@Schema(description = "회원세례명")
	String christianName;
	
	@Schema(description = "비밀번호")
	String password;
	
	@Schema(description = "사용여부")
	YesNo enabled;
	
	@Schema(description = "성별")
	GenderType gender;
	
	@Schema(description = "생년") 
	String birthYear; 
	
	@Schema(description = "생일")
	String birth;
	
	@Schema(description = "양음력여부")
	BirthType calendar;
	
	@Schema(description = "이메일") 
	String email;
	
	@Schema(description = "우편번호")
	String zipcode;
	
	@Schema(description = "주소")
	String address;
	
	@Schema(description = "도로명주소")
	String roadAddress;
	
	@Schema(description = "상세주소")
	String subAddress;
	
	@Schema(description = "전화번호")
	String phone;
	
	@Schema(description = "휴대폰번호")
	String mobile;
	
	@Schema(description = "마일리지")
	Integer emoney;
	
	@Schema(description = "메일수신여부")
	String mailing;
	
	@Schema(description = "문자수신여부")
	String sms;
	
	@Schema(description = "마지막로그인시간")
	String lastLogin; 
	
	@Schema(description = "마지막로그인ip")
	String lastLoginIp;
	
	@Schema(description = "마지막구매일")
	LocalDateTime lastSale;
	
	@Schema(description = "로그인횟수")
	Integer loginCnt;
	
	@Schema(description = "회원가입시 남기는말씀")
	String memo;
	
	@Schema(description = "관리자메모")
	String recommid;
	
	@Schema(description = "축일")
	String saintDate;
	
	@Schema(description = "축일여부")
	String saintDateBn;
	
	@Schema(description = "새우편번호")
	String zonecode;
	
	@Schema(description = "후원회원싸인")
	String sign;
	
	@Schema(description = "기본배송지여부")
	String addrYn;
	
	@Schema(description = "회원등급")
	Integer level;
	
	@Schema(description = "총구매금액")
	Integer totalBuyPrice;
	
	@Schema(description = "본인인증토큰") 
	String di;
	//검색필터옵션`
	@Schema(description = "총구매금액 체크")
	boolean sumPriceCheck;
	
	@Schema(description = "그룹필터")
	String groupOption;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	@Schema(description = "검색 주문일")
	String[] orderDate;  
	 
	@Schema(description = "양음력")   
	String birthType;  
	   
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	@Schema(description = "검색생일")   
	String[] birthDate;   
	
	@Schema(description = "검색 적립금")  
	Integer[] saveEmoney; 
	 
	@Schema(description = "검색 구매액")
	Integer[] buyMoney;
	
	@Schema(description = "검색 성멸")
	String genderType;
	 
//	@Schema(description = "생성일")
//	LocalDateTime createTime;
	
}
