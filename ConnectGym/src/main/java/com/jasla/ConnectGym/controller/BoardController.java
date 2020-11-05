package com.jasla.ConnectGym.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jasla.ConnectGym.domain.BoardDTO;
import com.jasla.ConnectGym.domain.PagingDTO;
import com.jasla.ConnectGym.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	public BoardService boardservice;

	// 모든 게시글 불러오기
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String home(PagingDTO pdto, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = boardservice.countBoard();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		pdto = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pdto);

		List<BoardDTO> list = boardservice.selectBoard(pdto);

	
		model.addAttribute("viewAll", list);

		return "board/board";
	}

	// 게시판 상세보기
	@RequestMapping(value = "/boardDetail.do")
	public String boardDetail(@RequestParam(value = "boNo", required = false) int boNo, Model model) {

		boardservice.plusHit(boNo);
		BoardDTO bdto = boardservice.getBoardDetail(boNo);
		model.addAttribute("boardDet", bdto);

		return "board/boardDetail";
	}
	
	// 게시글 작성 페이지 이동
	@RequestMapping(value = "/boardInsertForm.do", method = RequestMethod.GET)
	public String writeBoard() {
		
		return "board/boardInsertForm";
	}
	
	// 세션에 저장된 닉네임 가져오기
	@RequestMapping("memNick")
	public String nickName(HttpServletRequest request) {
		
		return (String)request.getSession().getAttribute("memNick");
	}
	
	// 게시글  insert 하기
	@RequestMapping(value="/insertBoard.do", method = RequestMethod.GET)
	public String insertBoard(BoardDTO bdto, Model model) {
		int boNo = 0;
		try {
			bdto.getBoNo();
			bdto.setBoNo(boNo);
			
			boardservice.insertBoardList(bdto);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "board/boardDetail.do?boNo=" + boNo;
	}


}

	
