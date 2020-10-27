package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jasla.ConnectGym.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("member")
public class MemberRestController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/emailCheck.do")
	public String IsEnableEmail(@RequestParam("email") String email) {
		
		log.debug("### MemberRestController : emailCheck.do ###");
		
		memberService.isEnableEmail(email);
		
		int result = memberService.isEnableEmail(email);
		
		if(result == 0 ) {
			
			return "이메일 사용가능 합니다.";
		}
		
		return "중복된 이메일 입니다.";
		
		
}


}
