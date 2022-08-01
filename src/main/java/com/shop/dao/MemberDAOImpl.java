package com.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	MemberDAO memberDao;

	@Override
	public List<MemberDTO> memberList() throws Exception {
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public MemberDTO viewMember(String id) throws Exception {
		return sqlSession.selectOne("member.viewMember", id);
	}

	@Override
	public void insertMember(MemberDTO mdto) throws Exception {
		sqlSession.insert("member.insertMember", mdto);
		
	}

	@Override
	public void updateMember(MemberDTO mdto) throws Exception {
		sqlSession.update("member.updateMember", mdto);		
	}

	@Override
	public void deleteMember(String id) throws Exception {
		sqlSession.delete("member.deleteMember", id);
		
	}

	@Override
	public int idck(String id) throws Exception {			
		return sqlSession.selectOne("member.idck",id);
	}

	@Override
	public MemberDTO signin(MemberDTO mdto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.signin", mdto);
	}

	@Override
	public void pwupdate(MemberDTO mdto) throws Exception {
		sqlSession.update("member.pwupdate", mdto);
		
	}
	
	
	}
	
	
