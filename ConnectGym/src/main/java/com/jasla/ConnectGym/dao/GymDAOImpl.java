package com.jasla.ConnectGym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jasla.ConnectGym.domain.GymVO;

@Repository
public class GymDAOImpl implements GymDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GymVO> selectAll() {		
		return sqlSession.selectList("selectAll");
	}

}
