package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.GymVO;

public interface GymDAO {
	List<GymVO> selectAll();  
}
