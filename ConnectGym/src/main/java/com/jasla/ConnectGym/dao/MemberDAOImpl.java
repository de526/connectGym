package com.jasla.ConnectGym.dao;

import java.util.List;

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
	
	
	@Override
	public MemberDTO login(MemberDTO dto) {
		return sqlSession.selectOne("login", dto);
	}
	// 회원가입
	@Override
	public int insertMember(MemberDTO dto) {
		log.info("dao insertMember");
		return sqlSession.insert("insertMember", dto);
		
	}
	// 회원목록
	@Override
	public List<MemberDTO> selectMemAll() {
		log.info("dao selectMemAll");
		return sqlSession.selectList("selectMemAll");
	}
	// 이메일 중복확인
	@Override
	public int emailCheck(String email) {
		log.info("dao emailCheck");
		return sqlSession.selectOne("emailCheck", email);
	}
	
}
	