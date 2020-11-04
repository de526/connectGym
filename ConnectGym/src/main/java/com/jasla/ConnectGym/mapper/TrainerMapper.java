package com.jasla.ConnectGym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.jasla.ConnectGym.domain.MemberDTO;

@Mapper
public interface TrainerMapper {
	
	@Select("SELECT img_name FROM img_T i,(select gym_no from member_T where mem_No = #{memNo}) g where i.gym_no = g.gym_no")
	List<String> tImgSelect(int memNo);
	
	@Select("SELECT * FROM member_T where mem_no = #{memNo}")
	MemberDTO trainerSelect(int memNo);
}
