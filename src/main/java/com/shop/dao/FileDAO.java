package com.shop.dao;

import java.util.List;

import com.shop.dto.DatabankDTO;

public interface FileDAO {
	public void databankinsert(DatabankDTO databank) throws Exception;	
	public List<DatabankDTO> databankList() throws Exception;
}
