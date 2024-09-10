package com.brighten.idi.module.ncp.service;

import java.util.List;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.dto.MemberListDto;
import com.brighten.idi.order.dto.OrderDto;

public interface NcpService {

	public void ncpSend(String mobile , String msg ,String templateCode);
}
