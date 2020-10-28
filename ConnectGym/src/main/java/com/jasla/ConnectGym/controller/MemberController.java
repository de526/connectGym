package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jasla.ConnectGym.domain.MemberDTO;
import com.jasla.ConnectGym.service.MemberService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MemberController {

	@Autowired
	public MemberService memberservice;
	
	// 테스트용 헤더가는 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String home(Model model) {
		return "member/join";
	}
	
	// 회원가입 
	@RequestMapping("/join.do")
	public String join(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model){
	
	log.info("회원 가입 처리");
	
	
	return "";
	}
}
