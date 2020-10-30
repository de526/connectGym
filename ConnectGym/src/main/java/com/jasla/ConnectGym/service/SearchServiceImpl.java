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

	// 헬스장 전체 불러오기
	@Override
	public List<GymDTO> selectGymAll() {
		return dao.selectGymAll();
	}

	// 트레이너 전체 불러오기
	@Override
	public List<MemberDTO> selectTraAll() {
		return dao.selectTraAll();
	}

	@Override
	public List<MemberDTO> trainerSearchResult(List<String> tags, String searchValue) {
		// 받은 태그들이랑 서치값으로 쿼리 작성하기 ㅠ (보안적으로 안정적이진 않지만 일단..)

		StringBuffer query = new StringBuffer(""); // select * from 쿼리~		
		//검색값 쿼리처리
		if (searchValue.length() == 0) {
			query.append("member_t");
		} else {
			query.append("(select * from member_t where mem_nick like '%" + searchValue + "%')");
		}		
		//선택된 태그 쿼리 처리
		if (tags.size() == 0) {
			query.append("where mem_level = 50");
		} else {
			for (int i = 1; i < tags.size(); i++) {
				if (i == 1) {
					query.append(" where mem_tag like '%" + tags.get(i) + "%'");
				} else {
					query.append(" and mem_tag like '%" + tags.get(i) + "%'");
				}
			}
		}
		log.info("트레이너검색 쿼리 : select * from "+query.toString());
		return dao.trainerSearchResult(query.toString());
	}

	@Override
	public List<GymDTO> gymSearchResult(List<String> tags, String searchValue) {
		StringBuffer query = new StringBuffer("");
		
/*		//검색값 쿼리처리
		if (searchValue.length() == 0) {
			query.append("member_t");
		} else {
			query.append("(select * from member_t where mem_nick like '%" + searchValue + "%')");
		}		
		//선택된 태그 쿼리 처리
		if (tags.size() == 0) {
			query.append("where mem_level = 50");
		} else {
			for (int i = 1; i < tags.size(); i++) {
				if (i == 1) {
					query.append(" where mem_tag like '%" + tags.get(i) + "%'");
				} else {
					query.append(" and mem_tag like '%" + tags.get(i) + "%'");
				}
			}
		}*/
		
		
		log.info("헬스장검색 쿼리 : select * from "+query.toString());
		
		
		return dao.gymSearchResult(query.toString());
	}

}
