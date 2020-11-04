package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.BoardDTO;
import com.jasla.ConnectGym.domain.PagingDTO;

public interface BoardDAO {

	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<BoardDTO> selectBoard(PagingDTO pdto);

	// 게시글 상세 조회
	public BoardDTO getBoardDetail(int boNo);
	
	// 조회수 증가
	public int plusHit(int boNo);
	
	// 게시글 등록
	public int insertBoard(BoardDTO bdto);
}