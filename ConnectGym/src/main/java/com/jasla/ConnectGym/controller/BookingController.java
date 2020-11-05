package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jasla.ConnectGym.service.BookingService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class BookingController {
	
	@Autowired
	private BookingService service;
	
	@RequestMapping("/booking")
	public String pageMove(Model model) {
		log.info("예약 페이지 가는 컨트롤러 ");
		

		return "booking/bookingPage";
	}
}
