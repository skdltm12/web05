package com.shop.myapp;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MybatisTest1 {
	private static final Logger log = LoggerFactory.getLogger(MybatisTest1.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void test() {
		try {
			SqlSession session = sqlSessionFactory.openSession();
			Connection con = session.getConnection();
			System.out.println("Mybatis 연결 성공");
			System.out.println("DB 연결 성공");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
