package com.jasla.ConnectGym.dao;

import com.jasla.ConnectGym.domain.MemberDTO;

public interface MemberDAO {
//	void insertMember(MemberDTO member);
	int isEnableEmail(String email);

}
