package com.jasla.ConnectGym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasla.ConnectGym.dao.BoardDAO;
import com.jasla.ConnectGym.domain.BoardDTO;
import com.jasla.ConnectGym.domain.PagingDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	public BoardDAO bdao;

	@Override
	public int countBoard() {
		
		return bdao.countBoard();
	}

	@Override
	public List<BoardDTO> selectBoard(PagingDTO pdto) {
		return bdao.selectBoard(pdto);
	}

	
}