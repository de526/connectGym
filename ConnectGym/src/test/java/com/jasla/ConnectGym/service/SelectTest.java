package com.jasla.ConnectGym.service;

import static org.junit.Assert.assertEquals;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


import lombok.extern.slf4j.Slf4j;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
@Slf4j
public class SelectTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		log.info("헬스장 이름 6개 가지고온거 맞나 보는 테스트 ㅎㅎ");
		assertEquals(6, sqlSession.selectList("selectAll").size());	
	
	}
	@Test
	public void MemEmailtest() {
		log.info("이메일 중복검사 테스트");
		assertEquals(1, (int) sqlSession.selectOne("isEnableEmail", "yoooon0104@gmail.com"));	
		
	}

}
