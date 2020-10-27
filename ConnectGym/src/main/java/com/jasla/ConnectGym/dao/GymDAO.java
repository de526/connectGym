package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;

public interface GymDAO {
	List<String> imgSelect(int gymNo); 
	GymDTO gymSelect(int gymNo);
	
}
