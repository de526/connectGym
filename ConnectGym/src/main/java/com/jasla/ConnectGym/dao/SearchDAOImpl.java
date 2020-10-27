package com.jasla.ConnectGym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;

@Repository
public class SearchDAOImpl implements SearchDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GymDTO> selectGymAll() {		
		return sqlSession.selectList("selectGymAll");
	}

	@Override
	public List<MemberDTO> selectTraAll() {		
		return sqlSession.selectList("selectTraAll");
	}

}
