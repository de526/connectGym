package com.jasla.ConnectGym.mapper;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;

public interface SearchMapper {
	List<GymDTO> selectAll();  
}
