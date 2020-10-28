package com.jasla.ConnectGym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.jasla.ConnectGym.domain.GymDTO;

@Mapper
public interface SearchMapper {
	
	@Select("SELECT * FROM gym_T")
	List<GymDTO> selectAll();  
}
