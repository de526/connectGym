package com.jasla.ConnectGym.mapper;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;


public interface GymMapper {
	List<String> imgSelect(int gymNo);  
	GymDTO gymSelect(int gymNo);
}
