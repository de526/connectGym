package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jasla.ConnectGym.service.GymService;



@Controller
public class HomeController2 {

	@Autowired
	public GymService service;
	
	// 테스트용 메인가는 컨트롤러
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public String home(Model model) {
		return "header";
	}



}
