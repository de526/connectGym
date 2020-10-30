package com.jasla.ConnectGym.mapper;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;


public interface GymMapper {
	List<String> imgSelect(int gymNo);  
	GymDTO gymSelect(int gymNo);
	MemberDTO gymTSelect(int gymNo);
}
