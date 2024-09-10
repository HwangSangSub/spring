package com.brighten.idi.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.group.dto.MemberGroupDto;

@Mapper
public interface MemberMapper {
	
	MemberDto member (MemberDto memberDto);
	
	boolean passwordMatch(Map<String,Object> map);
	
	String passwordEncode(CharSequence password);
	
	List<MemberGroupDto> memberGroupList();

	List<MemberDto> memberList(MemberDto memberDto);
	
	int memberListCnt(MemberDto memberDto);
	
	boolean updateMember(MemberDto dto);
	
}
 