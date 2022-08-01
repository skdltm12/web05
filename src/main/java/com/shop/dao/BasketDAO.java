package com.shop.dao;

import java.util.List;

import com.shop.dto.BasketDTO;


public interface BasketDAO {
	public List<BasketDTO> basketList(String bsuid) throws Exception;
	public void insertBasket(BasketDTO bdto) throws Exception;
	public void deleteBasket(int bsnum) throws Exception;
	public void update(BasketDTO bdto) throws Exception;
}
