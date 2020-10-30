package com.jasla.ConnectGym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;

import com.jasla.ConnectGym.dao.MemberDAO;
//import com.jasla.ConnectGym.domain.MemberDTO;
import com.jasla.ConnectGym.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;

	
	
	@Override
	public int insertMember(MemberDTO dto) {
		return dao.insertMember(dto);
	}

	@Override
	public List<MemberDTO> selectMemAll() {
		return dao.selectMemAll();
	}

	@Override
	public int emailCheck(String email) {
		log.info("서비스 타는중");
		return dao.emailCheck(email);
	}
	
	

	
	
	}


