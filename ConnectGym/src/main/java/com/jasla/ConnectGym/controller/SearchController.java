package com.jasla.ConnectGym.controller;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jasla.ConnectGym.domain.GymVO;
import com.jasla.ConnectGym.service.GymService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SearchController {

	@Autowired
	public GymService service;

	// DB 연결 확인하는 컨트롤러
	@RequestMapping("/db")
	public String dbtest(Model model) {
		log.info("db연결 테스트 컨트롤러");
		model.addAttribute("list", service.selectAll());		
		return "search/searchPage";
	}
	
	@RequestMapping("/searchList.do")
	@ResponseBody
	public List<GymVO> searchList(@RequestParam("tags[]") List<String> tags,
			@RequestParam("search") String searchValue) {
		log.info("ajax test@@@");
		log.info(tags.toString());
		log.info(searchValue);
		
		
		return service.selectAll();
	}

}
