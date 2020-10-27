package com.jasla.ConnectGym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasla.ConnectGym.dao.SearchDAO;
import com.jasla.ConnectGym.domain.GymDTO;


@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	public SearchDAO dao;
		
	@Override
	public List<GymDTO> selectAll() {
		return dao.selectAll();
	}

}
