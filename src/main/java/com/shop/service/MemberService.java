package com.shop.service;

import java.util.List;

import com.shop.dto.MemberDTO;

public interface MemberService {
	public List<MemberDTO> memberList() throws Exception;
	public MemberDTO viewMember(String mid) throws Exception;
	public void insertMember(MemberDTO mdto) throws Exception;
	public void updateMember(MemberDTO mdto) throws Exception;
	public void deleteMember(String id) throws Exception;
	public MemberDTO signin(MemberDTO mdto) throws Exception;
	public int idck(String id) throws Exception;
	public void pwupdate(MemberDTO mdto) throws Exception;
}
