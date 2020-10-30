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
	public void insertMember(MemberDTO dto) {
		dao.insertMember(dto);
	}

	@Override
	public List<MemberDTO> selectMemAll() {
		return dao.selectMemAll();
	}

	//	@Transactional(readOnly=true)
	@Override
	public int isEnableEmail(String email) {
		log.info("svc isEnableEmail");
		return dao.isEnableEmail(email);
	}
	
	
	}


