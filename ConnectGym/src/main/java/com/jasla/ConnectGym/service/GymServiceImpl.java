package com.jasla.ConnectGym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasla.ConnectGym.dao.GymDAO;
import com.jasla.ConnectGym.domain.GymVO;


@Service
public class GymServiceImpl implements GymService {

	@Autowired
	public GymDAO dao;
		
	@Override
	public List<GymVO> selectAll() {
		return dao.selectAll();
	}

}
