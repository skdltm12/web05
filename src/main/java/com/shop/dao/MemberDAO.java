package com.shop.dao;

import java.util.List;

import com.shop.dto.MemberDTO;

public interface MemberDAO {
	public List<MemberDTO> memberList() throws Exception;
	public MemberDTO viewMember(String id) throws Exception;
	public void insertMember(MemberDTO mdto) throws Exception;
	public void updateMember(MemberDTO mdto) throws Exception;
	public void deleteMember(String id) throws Exception;
	public int idck(String id) throws Exception;
	public MemberDTO signin(MemberDTO mdto) throws Exception;
	public void pwupdate(MemberDTO mdto) throws Exception;
}
