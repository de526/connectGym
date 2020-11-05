package com.jasla.ConnectGym.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookingDAOImpl implements BookingDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
}
