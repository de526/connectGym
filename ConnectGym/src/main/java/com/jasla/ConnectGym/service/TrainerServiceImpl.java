package com.jasla.ConnectGym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jasla.ConnectGym.dao.TrainerDAO;


@Service
public class TrainerServiceImpl implements TrainerService {

	@Autowired
	public TrainerDAO dao;
	
	@Override
	public String trainerService(Model model, int memNo) {
		
		List<String> list = dao.tImgSelect(memNo);
		model.addAttribute("tImglist", list);
		
//		이미지 모달용 문자열 가공
		String img = "[";
		for (int i = 0; i < list.size(); i++) {
			img += "'" + list.get(i) + "'";
			if (i < list.size() - 1) {
				img += ", ";
			}
		}
		img += "]";
		model.addAttribute("tImgString", img);
		
		return "gym/trainerPage";
	}

}
