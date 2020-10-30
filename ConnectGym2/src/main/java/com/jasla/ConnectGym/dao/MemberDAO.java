package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.MemberDTO;

public interface MemberDAO {
	
	// 회원가입
	void insertMember(MemberDTO dto);
	
	// 회원가입 중복검사
	// 이메일 중복검사
	int isEnableEmail(String email);
	
	
	
	
	//회원 조회
	List<MemberDTO> selectMemAll();
	
	

}
