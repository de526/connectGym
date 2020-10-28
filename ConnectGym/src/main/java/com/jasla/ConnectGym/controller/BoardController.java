package com.jasla.ConnectGym.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jasla.ConnectGym.domain.BoardDTO;
import com.jasla.ConnectGym.service.BoardService;


@Controller
public class BoardController {

	@Autowired
	public BoardService service;
	
	// 테스트용 게시판가는 컨트롤러
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String home(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		List<BoardDTO> list = service.selectBoardList();
		
		for (int i = 0; i < list.size(); i++) {
			String newDate = sdf.format(list.get(i).getBoWritedate());
			list.get(i).setBoDate(newDate);
		}
		model.addAttribute("bList", list);
		return "board/board";
	}
}