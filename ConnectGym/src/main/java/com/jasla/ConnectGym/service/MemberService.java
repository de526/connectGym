package com.jasla.ConnectGym.service;

import java.util.List;

import com.jasla.ConnectGym.domain.MemberDTO;

public interface MemberService {
	MemberDTO login(MemberDTO dto);
	List<MemberDTO> selectMemAll();
	int insertMember(MemberDTO dto);
	int emailCheck(String email);

}
