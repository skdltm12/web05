package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.BasketDAO;
import com.shop.dto.BasketDTO;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired
	BasketDAO basketDao;
	
	
	
	@Override
	public void update(BasketDTO bdto) throws Exception {
		basketDao.update(bdto);
		
	}

	@Override
	public List<BasketDTO> basketList(String bsuid) throws Exception {
		return basketDao.basketList(bsuid);
	}

	@Override
	public void insertBasket(BasketDTO bdto) throws Exception {
		basketDao.insertBasket(bdto);		
	}

	@Override
	public void deleteBasket(int bsnum) throws Exception {
		basketDao.deleteBasket(bsnum);		
	}
	
}
