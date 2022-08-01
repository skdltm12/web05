package com.shop.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.dto.MemberDTO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class DAOTest2 {

	@Autowired
	SqlSession sqlSession;
	
// --수정 전
//	@Test
//	public void test() {
//		System.out.println("DAO Test~!");
//	}

	@Test
	public void test() {
	System.out.println("DAO테스트");	
	}

	public List<MemberDTO> sampleList(){
		return sqlSession.selectList("sample.sampleList");
	}
	
	public int sampleCount(){
		return sqlSession.selectOne("sample.sampleCount");
	}
}
