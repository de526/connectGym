package com.jasla.ConnectGym.service;

import java.util.List;

import com.jasla.ConnectGym.domain.BoardDTO;

public interface BoardService {
	List<BoardDTO> selectBoardList();
}	