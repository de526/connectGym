package com.jasla.ConnectGym.controller;


import java.sql.Date;
import java.text.SimpleDateFormat;
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
		log.info("검색 페이지 모델 가지고 가는곳 ");
		//메인에 기본으로 트레이너 정보먼저 뿌리기!		
		
		model.addAttribute("gymList", service.selectGymAll());
		model.addAttribute("traList", service.selectTraAll());
		log.info(service.selectTraAll());
		return "search/searchPage";
	}
	
	@RequestMapping("/searchList.do")
	@ResponseBody
	public List<GymDTO> searchList(@RequestParam("tags[]") List<String> tags,
			@RequestParam("search") String searchValue) {
		log.info("ajax test@@@");
		log.info(tags.toString());
		log.info(searchValue);		
		
		return service.selectGymAll();
	}
	
	/*@RequestMapping("/searchTrainer.do")
	@ResponseBody
	public List<mem>*/
	

}
