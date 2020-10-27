package com.jasla.ConnectGym.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jasla.ConnectGym.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;

//	@Override
//	public void insertMember(MemberDTO member) {
//		log.info("dao insertMember");
//		sqlSession.insert("mapper.MemberMaaper.insertMember", member);
//		
//	}

	@Override
	public int isEnableEmail(String email) {
		log.info("dao isEnableEmail");
		return sqlSession.selectOne("isEnableEmail", email);
		
	}
	
	
	
	

	

}
