package com.brighten.idi.emoney.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.emoney.dto.EmoneyDto;
import com.brighten.idi.emoney.dto.EmoneyInfoDto;
import com.brighten.idi.member.dto.MemberDto;

@Mapper
public interface EmoneyMapper {
	
	public List<EmoneyDto> emoneyList(MemberDto memberDto);
	
	public boolean insertEmoney(EmoneyDto emoneyDto);
	
	public EmoneyInfoDto emoneyInfo(); 
	
}
