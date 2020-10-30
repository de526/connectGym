package com.jasla.ConnectGym.service;

import java.util.List;

import com.jasla.ConnectGym.domain.BoardDTO;
import com.jasla.ConnectGym.domain.PagingDTO;

public interface BoardService {

	// 게시물 총 갯수
	public int countBoard();
		
	// 페이징 처리 게시글 조회
	public List<BoardDTO> selectBoard(PagingDTO pdto);
}	