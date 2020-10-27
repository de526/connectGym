package com.jasla.ConnectGym.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jasla.ConnectGym.dao.GymDAO;


@Service
public class GymImgServiceImpl implements GymService {

	@Autowired
	public GymDAO dao;
		
	@Override
	public String selectAll(Model model, int gymNo) {
		List<String> list = dao.selectAll(gymNo);
		model.addAttribute("list", list);
		
		return "gym/gymPage";
	}

}
