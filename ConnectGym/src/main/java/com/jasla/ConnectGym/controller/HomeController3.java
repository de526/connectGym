package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jasla.ConnectGym.service.GymService;



@Controller
public class HomeController3 {

	@Autowired
	public GymService service;
	
	// 테스트용 게시판가는 컨트롤러
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String home(Model model) {
		return "board/boardList";
	}



}
