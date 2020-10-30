package com.jasla.ConnectGym.dao;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;

public interface SearchDAO {
	List<GymDTO> selectGymAll();  
	List<MemberDTO> selectTraAll();
	List<MemberDTO> trainerSearchResult(String query);
	List<GymDTO> gymSearchResult(String query);
}
