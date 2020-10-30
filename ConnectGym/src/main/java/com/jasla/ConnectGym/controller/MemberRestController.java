package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jasla.ConnectGym.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
/* @RequestMapping("member") */
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	//이메일 중복검사
	@PostMapping("/mailcheck.do")
	public int emailCheck(@RequestParam("mail") String mem_mail, Model model) {
		log.info("mem_mail:" + mem_mail);
		int result = memberService.emailCheck(mem_mail);
		return result;

	}

}
