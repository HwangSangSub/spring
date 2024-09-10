package com.brighten.idi.info.service;

import java.util.List;

import com.brighten.idi.info.dto.BankDto;
import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.util.BriPage;

public interface InfoService {
	
	List<BankDto> bankList() throws Exception;
	
}
