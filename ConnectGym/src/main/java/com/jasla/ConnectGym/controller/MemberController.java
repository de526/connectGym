package com.jasla.ConnectGym.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//가입 선택 페이지 이동
	@RequestMapping("/selectjoin")
	public String goselectjoin(Model model) {
		return "member/selectJoin";
	}
	//일반회원 가입 페이지 이동
	@RequestMapping("/memberjoin")
	public String gomemjoin(Model model) {
		return "member/memberJoin";
	}
	//트레이너 가입 페이지 이동
	@RequestMapping("/trainerjoin")
	public String gotrainerjoin(Model model) {
		return "member/trainerJoin";
	}
	//로그인 페이지 이동
	@RequestMapping("/login")
	public String gologin(Model model) {
		return "member/login";
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
	@Transactional
	@RequestMapping(value = "/memberjoin.do", method = RequestMethod.POST)
	public String memberJoin(MemberDTO dto, Model model) {
		log.info(dto.toString());
		int result = service.insertMember(dto);
		log.info(""+result);
		model.addAttribute("result",result);
		return "member/joinResult";
	}
	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberDTO dto, HttpServletRequest req, RedirectAttributes rttr) {
		log.info("post login");
		
		HttpSession session = req.getSession();
		MemberDTO login = service.login(dto);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value= "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
		
}
