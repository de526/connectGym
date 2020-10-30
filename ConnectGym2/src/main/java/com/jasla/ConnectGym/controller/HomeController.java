package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jasla.ConnectGym.service.SearchService;


import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {

	@Autowired
	public SearchService service;
	
	// 테스트용 메인가는 컨트롤러
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		log.info("첫번째 컨트롤러");
	
		return "NewFile";
	}



}
