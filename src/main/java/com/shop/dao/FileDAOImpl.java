package com.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.dto.DatabankDTO;
@Repository
public class FileDAOImpl implements FileDAO {

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public void databankinsert(DatabankDTO databank) throws Exception {
		sqlsession.insert("databank.databankinsert",databank);
	}

	@Override
	public List<DatabankDTO> databankList() throws Exception {
		return sqlsession.selectList("databank.databankList");
	}

	
}
