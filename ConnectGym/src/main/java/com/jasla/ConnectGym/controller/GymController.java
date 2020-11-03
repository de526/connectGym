
package com.jasla.ConnectGym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jasla.ConnectGym.service.GymService;
import com.jasla.ConnectGym.service.TrainerService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class GymController {

	@Autowired
	public GymService gymService;

	// gymPage 이동 컨트롤러
	@RequestMapping("/gym")
	public String gym(Model model, @RequestParam("gymNo") int gymNo) {
		log.info("gymPage 이동 컨트롤러");
		
		return gymService.gymService(model, gymNo);
	}
	
	@Autowired
	public TrainerService trainerService;

	// trainerPage 이동 컨트롤러
		@RequestMapping("/trainer")
	public String trainer(Model model, @RequestParam("memNo") int memNo) {
		log.info("trainerPage 이동 컨트롤러");
		
		return trainerService.trainerService(model, memNo);
	}
	
}
