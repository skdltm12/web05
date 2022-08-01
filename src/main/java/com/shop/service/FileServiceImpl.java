package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.FileDAO;
import com.shop.dto.DatabankDTO;

@Service
public class FileServiceImpl implements FileService{
	@Autowired
	FileDAO fileDao;

	@Override
	public void databankinsert(DatabankDTO databank) throws Exception {
		fileDao.databankinsert(databank);		
	}

	@Override
	public List<DatabankDTO> databankList() throws Exception {
		return fileDao.databankList();
	}
	
	
	
	
}
