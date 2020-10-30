package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jasla.ConnectGym.domain.MemberDTO;
import com.jasla.ConnectGym.service.MemberService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MemberController {

	@Autowired
	public MemberService service;
	
//	// 테스트용 헤더가는 컨트롤러
//	@RequestMapping(value = "/join", method = RequestMethod.GET)
//	public String home(Model model) {
//		return "member/join";
//	}
	
	//회원가입 페이지 이동
	@RequestMapping("/join")
	public String gojoin(Model model) {
		return "member/memberJoin";
	}
	
	//DB 연결 확인 
	@RequestMapping("/memberdb")
	public String dbtest(Model model) {
		log.info("검색페이지 모델 가지고 감");
		//메인에 기본으로 멤버 정보먼저 뿌리기
		
		model.addAttribute("memList", service.selectMemAll());
//		log.info(service.selectMemAll());
		return "member/memberList";
		
	}
	// 회원가입 
	@RequestMapping(value = "/memberjoin.do", method = RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.insertMember(dto);
		mav.setViewName("memberloginform");
		return mav;
	}
	
}
