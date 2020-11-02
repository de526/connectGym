package com.jasla.ConnectGym.controller;

import java.util.List;

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
	public BoardService service;

	// 모든 게시글 불러오는 컨트롤러
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String home(PagingDTO pdto, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = service.countBoard();
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

		List<BoardDTO> list = service.selectBoard(pdto);

	
		model.addAttribute("viewAll", list);

		return "board/board";
	}

	@RequestMapping(value = "/boardDetail.do")
	public String boardDetail(@RequestParam(value = "boNo", required = false) int boNo, Model model) {


		service.plusHit(boNo);
		BoardDTO bdto = service.getBoardDetail(boNo);
		model.addAttribute("boardDet", bdto);

		return "board/boardDetail";
	}
	
	
	@RequestMapping(value = "/writeBoard.do", method = RequestMethod.GET)
	public String writeBoard() {
	
		return "board/insertBoard";
	}


}

	
