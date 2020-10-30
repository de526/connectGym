package com.jasla.ConnectGym.service;

import java.util.List;

import com.jasla.ConnectGym.domain.MemberDTO;

public interface MemberService {
	
	List<MemberDTO> selectMemAll();
	void insertMember(MemberDTO dto);
	int isEnableEmail (String email);

}