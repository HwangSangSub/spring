package com.brighten.idi.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestMapper {

	List<HashMap<String,Object>> selectOriginMember(int i);

	boolean newMemberInsert(List<HashMap<String,Object>> list); 
	
	int originMemberCount();
	
	List<HashMap<String,Object>> originGrp();
	
	boolean newGrpInsert(Map<String, Object> map);
}
  