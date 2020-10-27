package com.jasla.ConnectGym.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jasla.ConnectGym.domain.GymDTO;


@Repository
public class GymDAOImpl implements GymDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<String> imgSelect(int gymNo) {		
		return sqlSession.selectList("imgSelect", gymNo);
	}

	@Override
	public GymDTO gymSelect(int gymNo) {
		System.out.println("ddddddddddddddddddddddddddddddddddddddddddddd");
		return sqlSession.selectOne("gymSelect", gymNo);
	}
	
}
