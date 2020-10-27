package com.jasla.ConnectGym.service;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;

public interface SearchService {
	List<GymDTO> selectAll(); 
}
