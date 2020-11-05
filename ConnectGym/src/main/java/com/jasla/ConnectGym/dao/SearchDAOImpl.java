package com.jasla.ConnectGym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jasla.ConnectGym.domain.GymDTO;
import com.jasla.ConnectGym.domain.MemberDTO;

@Repository
public class SearchDAOImpl implements SearchDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GymDTO> selectGymAll() {		
		//헬스장 전체 정보 가져오기
		return sqlSession.selectList("selectGymAll");
	}

	@Override
	public List<MemberDTO> selectTraAll() {		
		//트레이너 전체정보 가져오기
		return sqlSession.selectList("selectTraAll");
	}
	//매퍼 이름이랑 파라미터 넣어주는거 잊지말기 ㅠㅠ 맨날 까먹어
	@Override
	public List<MemberDTO> trainerSearchResult(String query) {
		//서비스에서 쿼리 작업한거 받아서 직접 연결, 트레이너 검색결과
		return sqlSession.selectList("trainerSearchResult",query);
	}

	@Override
	public List<GymDTO> gymSearchResult(String query) {
		//헬스장 검색결과
		return sqlSession.selectList("gymSearchResult",query);
	}

}
