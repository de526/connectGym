package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.BoardDTO;

public interface BoardDAO {

	List<BoardDTO> selectBoardList();
}	