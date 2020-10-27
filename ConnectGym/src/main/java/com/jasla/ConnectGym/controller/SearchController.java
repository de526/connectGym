package com.jasla.ConnectGym.controller;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.service.SearchService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SearchController {

	@Autowired
	public SearchService service;

	// DB 연결 확인하는 컨트롤러
	@RequestMapping("/search")
	public String dbtest(Model model) {
		log.info("db연결 테스트 컨트롤러");
		model.addAttribute("list", service.selectAll());
		//헬스장 전체 정보 가져오기
		return "search/searchPage";
	}
	
	@RequestMapping("/searchList.do")
	@ResponseBody
	public List<GymDTO> searchList(@RequestParam("tags[]") List<String> tags,
			@RequestParam("search") String searchValue) {
		log.info("ajax test@@@");
		log.info(tags.toString());
		log.info(searchValue);
		
		
		return service.selectAll();
	}

}
