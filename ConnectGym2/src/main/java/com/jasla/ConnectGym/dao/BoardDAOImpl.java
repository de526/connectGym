package com.jasla.ConnectGym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jasla.ConnectGym.domain.BoardDTO;
import com.jasla.ConnectGym.domain.PagingDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public int countBoard() {
		return sqlSession.selectOne("countBoard");
	}

	@Override
	public List<BoardDTO> selectBoard(PagingDTO pdto) {
		return sqlSession.selectList("selectBoard", pdto);
	}
}