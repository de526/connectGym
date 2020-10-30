package com.jasla.ConnectGym.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jasla.ConnectGym.dao.GymDAO;
import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;


@Service
public class GymServiceImpl implements GymService {

	@Autowired
	public GymDAO dao;
		
	@Override
	public String selectAll(Model model, int gymNo) {
		List<String> list = dao.imgSelect(gymNo);
		model.addAttribute("imglist", list);
		
		GymDTO gdto = dao.gymSelect(gymNo);
		model.addAttribute("gdto", gdto);
		
		List<MemberDTO> gmdto = dao.gymTSelect(gymNo);
		model.addAttribute("gmdto", gmdto);
		
		
		return "gym/gymPage";
	}

}
