package com.jasla.ConnectGym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasla.ConnectGym.dao.SearchDAO;
import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	public SearchDAO dao;
		
	//헬스장 전체 불러오기
	@Override
	public List<GymDTO> selectGymAll() {
		return dao.selectGymAll();
	}
	//트레이너 전체 불러오기
	@Override
	public List<MemberDTO> selectTraAll() {
		return dao.selectTraAll();
	}

	@Override
	public List<MemberDTO> trainerSearchResult(List<String> tags, String searchValue) {
		
		String query = "";
		
		if(!searchValue.equals("")) {
			query = "(select * from member_t where mem_nick like '%"+searchValue+"%')";
		}else {
			query = "member_t";
		}
		
		for(int i=1;i<tags.size();i++) {
			if(i==1) {
				query += " where mem_tag like '%"+tags.get(i)+"%'";
			}else {
				query += " and mem_tag like '%"+tags.get(i)+"%'";
			}
		}					
		log.info(query);
		return dao.trainerSearchResult(query);
	}
	

}
