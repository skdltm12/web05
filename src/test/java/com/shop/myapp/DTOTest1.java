package com.shop.myapp;

import org.codehaus.plexus.logging.Logger;
import org.junit.Assert;
import org.junit.Test;

import com.shop.dto.MemberDTO;

import lombok.extern.log4j.Log4j;

@Log4j
public class DTOTest1 {
	
	@Test	
	public void test() {
		log.info("DTO Test~!");
		MemberDTO member = new MemberDTO();
		member.setUname("관리자");
		member.setId("admin");
		member.setEmail("admin@shop.com");
		member.setPhone("010-1234-5678");
		member.setBirth("2022-06-28");
		dtotest(member);
	}
//수정 전
//	public void DTOTest(MemberDTO mem) {
//		try {
//			Assert.assertNotNull(mem);	//값이 비어있는지 테스트
//			Assert.assertEquals(mem.getUname(), "관리자"); //특정 속성값의 일치 비교 테스트
//		} catch(Exception e) {
//			Assert.fail("해당 DTO가 비정상적임");
//		}}
	
//수정 후.		메소드명이 부적합하다는 오류가 나와서 전부 소문자로 변경해주었습니다.
	public void dtotest(MemberDTO mem) {
		try {
			Assert.assertNotNull(mem);	//값이 비어있는지 테스트
			Assert.assertEquals(mem.getUname(), "관리자"); //특정 속성값의 일치 비교 테스트
		} catch(Exception e) {
			Assert.fail("해당 DTO가 비정상적임");
		}
	}
}