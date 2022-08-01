package com.shop.service;

import java.util.List;

import com.shop.dto.DatabankDTO;

public interface FileService {
	public void databankinsert(DatabankDTO databank) throws Exception;
	public List<DatabankDTO> databankList() throws Exception;
}
