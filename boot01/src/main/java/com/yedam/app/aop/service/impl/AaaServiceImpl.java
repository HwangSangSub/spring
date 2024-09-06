package com.yedam.app.aop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.app.aop.mapper.AaaMapper;
import com.yedam.app.aop.service.AaaService;

@Service
public class AaaServiceImpl implements AaaService {
	private AaaMapper aaaMapper;
	@Autowired
	AaaServiceImpl(AaaMapper aaaMapper){
		this.aaaMapper = aaaMapper;
	}

	@Transactional // DB에 트랜젝션을 거는 어노테이션 > AutoCommit를 잠시 풀고 아래의 쿼리가 완벽하게 실행되면 트랜젝션을 풀어준다.
	@Override
	public void insert() {
		aaaMapper.insert("101");
		aaaMapper.insert("a101");
	}// end insert
	
}// end class
