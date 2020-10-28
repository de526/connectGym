package com.jasla.ConnectGym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasla.ConnectGym.dao.BoardDAO;
import com.jasla.ConnectGym.domain.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	public BoardDAO bdao;

	@Override
	public List<BoardDTO> selectBoardList() {
		return bdao.selectBoardList();
	}
}