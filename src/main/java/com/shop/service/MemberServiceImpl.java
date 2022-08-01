package com.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.inject.Inject;
import com.shop.dao.MemberDAO;
import com.shop.dto.MemberDTO;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDao;
	SqlSession session;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;

	@Override
	public List<MemberDTO> memberList() throws Exception {
		return memberDao.memberList();
	}

	@Override
	public MemberDTO viewMember(String id) throws Exception {		
		return memberDao.viewMember(id);
	}

	@Override
	public void insertMember(MemberDTO mdto) throws Exception {
		memberDao.insertMember(mdto);
		
	}

	@Override
	public void updateMember(MemberDTO mdto) throws Exception {
		memberDao.updateMember(mdto);		
	}

	@Override
	public void deleteMember(String id) throws Exception {
		memberDao.deleteMember(id);
		
	}

	@Override
	public MemberDTO signin(MemberDTO mdto) throws Exception {
		//System.out.println("로그인 아이디 : "+mdto.getId());
		 return memberDao.signin(mdto);
	}

	@Override
	public int idck(String id) throws Exception {
		//System.out.println("검증할 아이디 : "+id);
		return memberDao.idck(id);
	}

	@Override
	public void pwupdate(MemberDTO mdto) throws Exception {
		memberDao.pwupdate(mdto);		
	}
	
	
	
	
}
