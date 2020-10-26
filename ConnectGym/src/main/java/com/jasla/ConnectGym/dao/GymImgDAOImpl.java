package com.jasla.ConnectGym.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class GymImgDAOImpl implements GymImgDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<String> selectAll(int gymNo) {		
		return sqlSession.selectList("gymImgSelectAll", gymNo);
	}

}
