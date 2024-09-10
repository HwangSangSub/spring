package com.brighten.idi.info.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.brighten.idi.info.dto.BankDto;
import com.brighten.idi.info.mapper.InfoMapper;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;

@Tag(name = "멤버")
@Service
@RequiredArgsConstructor
public class InfoServiceImpl implements InfoService {
	
	private final InfoMapper infoMapper;

	@Override
	public List<BankDto> bankList() throws Exception {
		// TODO Auto-generated method stub
		return infoMapper.bankList();
	}


}
