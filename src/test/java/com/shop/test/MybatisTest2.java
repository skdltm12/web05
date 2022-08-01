package com.shop.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.dto.MemberDTO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class MybatisTest2 {	
	@Autowired
	SqlSession sqlSession; 

	@Test
	public void testMybatis() {
		try { 
			log.info("Mybatis 실행 성공");
			int cnt = sqlSession.selectOne("sample.sampleCount");
			log.info("데이터 바인딩 성공~!");
			
			log.info("회원수 : "+cnt+"명");
			
			log.info("데이터 출력 성공~!");
		} catch(Exception e) {
			log.info("테스트 종료");
		}
	}
	
	@Test
	public void testMybatis2() {
		try {
			log.info("Mybatis 실행 성공2");
			List<MemberDTO> memList = sqlSession.selectList("sample.sampleList");
			log.info("데이터 바인딩 성공~!");
			for(int i=0;i < memList.size();i++) {
				MemberDTO member = new MemberDTO();
				member = memList.get(i);
				
				log.info("회원명 : {}"+ member.getUname());
			}
			log.info("데이터 출력 성공~!");
		} catch(Exception e) {
			log.info("테스트 종료2");
		}
	}
	
	public int mybatisRunning() {
		log.info("Mybatis 실행 성공2");
		return sqlSession.selectOne("sample.memberCount");
	}
	
	public List<MemberDTO> mybatisRunning2() {
		log.info("Mybatis 실행 성공");
		return sqlSession.selectList("sample.memberList");
	}
}