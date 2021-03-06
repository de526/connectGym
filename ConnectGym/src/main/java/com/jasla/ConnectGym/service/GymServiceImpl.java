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
	public String gymService(Model model, int gymNo) {
		List<String> list = dao.imgSelect(gymNo);
		model.addAttribute("imglist", list);
		
//		이미지 모달용 문자열 가공
		String img = "[";
		for (int i = 0; i < list.size(); i++) {
			img += "'" + list.get(i) + "'";
			if (i < list.size() - 1) {
				img += ", ";
			}
		}
		img += "]";
		model.addAttribute("imgString", img);
		
		GymDTO gdto = dao.gymSelect(gymNo);
		model.addAttribute("gdto", gdto);
		
		List<MemberDTO> gmdto = dao.gymTSelect(gymNo);
		model.addAttribute("gmdto", gmdto);
		
		
		return "gym/gymPage";
	}

}
