package com.jasla.ConnectGym.mapper;

import java.util.List;

import com.jasla.ConnectGym.domain.BoardDTO;

public interface BoardMapper {

	List<BoardDTO> selectBoardList();
}