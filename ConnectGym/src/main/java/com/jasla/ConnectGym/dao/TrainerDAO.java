package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.MemberDTO;


public interface TrainerDAO {
	List<String> tImgSelect(int memNo); 
	MemberDTO trainerSelect(int memNo);
	
}
