package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;

public interface GymDAO {
	List<String> imgSelect(int gymNo); 
	GymDTO gymSelect(int gymNo);
	List<MemberDTO> gymTSelect(int gymNo);
	
}
