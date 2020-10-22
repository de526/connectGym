package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasla.ConnectGym.service.GymService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class GymController {

	@Autowired
	public GymService service;

	// DB 연결 확인하는 컨트롤러
	@RequestMapping("/db")
	public String dbtest(Model model) {
		log.info("db연결 테스트 컨트롤러");
		model.addAttribute("list", service.selectAll());
		
		return "main2";
	}

}
