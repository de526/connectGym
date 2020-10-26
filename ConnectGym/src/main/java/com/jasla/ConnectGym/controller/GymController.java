package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jasla.ConnectGym.service.GymImgService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class GymController {

	@Autowired
	public GymImgService service;

	// DB 연결 확인하는 컨트롤러
	@RequestMapping("/gym")
	public String dbtest(Model model, @RequestParam("gymNo") int gymNo) {
		log.info("img_t db연결 테스트 컨트롤러");
		
		
		
		return service.selectAll(model, gymNo);
	}
	
}
