package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jasla.ConnectGym.service.SearchService;



@Controller
public class MemberController {

	@Autowired
	public SearchService service;
	
	// 테스트용 헤더가는 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String home(Model model) {
		return "member/join";
	}



}
