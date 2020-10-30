package com.jasla.ConnectGym.controller;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jasla.ConnectGym.domain.MemberDTO;
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
	public String searchList(@RequestParam("tags[]") List<String> tags,
			@RequestParam("search") String searchValue,Model model) {
		
		log.info("태그랑 서치값 받아서 트레이너 목록 가져오는 ajax rest controller");
		log.info(tags);
		log.info(tags.size());
		log.info(searchValue.length());
		//log.info(service.trainerSearchResult(tags, searchValue));
		
		//둘다 null 일때는 전체출력이여야함
		if(tags.size()==0 & searchValue.length()==0) {
			log.info("둘다 null 이라 전체 가져오는거 타는중 ");
			model.addAttribute("traList",service.selectTraAll());
		}else {
			model.addAttribute("traList",service.trainerSearchResult(tags, searchValue));
		}
			
		return "search/searchTrainer";
	}
	

}