package com.jasla.ConnectGym.service;

import java.util.List;

import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;

public interface SearchService {
	List<GymDTO> selectGymAll(); 
	List<MemberDTO> selectTraAll();
	List<MemberDTO> trainerSearchResult(List<String> tags,String searchValue);
}
