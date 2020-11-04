package com.jasla.ConnectGym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jasla.ConnectGym.domain.MemberDTO;

@Repository
public class TrainerDAOImpl implements TrainerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<String> tImgSelect(int memNo) {
		return sqlSession.selectList("tImgSelect", memNo);
	}

	@Override
	public MemberDTO trainerSelect(int memNo) {
		return sqlSession.selectOne("trainerSelect", memNo);
	}

	

	
	
}
