package com.jasla.ConnectGym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;

@Mapper
public interface SearchMapper {
	
	//헬스장 전체 가져오기
	@Select("SELECT * FROM gym_T")
	List<GymDTO> selectGymAll(); 
	
	//트레이너 전체 가져오기
	@Select("select * from member_t where mem_level = 50")
	List<MemberDTO> selectTraAll();
	
	// 태그값이랑 검색값 가지고 트레이너 검색
	@Select("select * from ${query}")
	List<MemberDTO> trainerSearchResult(String query);
	
	//태그값, 검색값 가지고 헬스장 검색
	@Select("select * from gym_t g where ${query}")
	List<GymDTO> gymSearchResult(String query);
	
}
