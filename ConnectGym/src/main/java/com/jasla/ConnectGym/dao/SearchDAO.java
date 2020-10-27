package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;

public interface SearchDAO {
	List<GymDTO> selectAll();  
}
