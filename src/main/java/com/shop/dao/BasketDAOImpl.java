package com.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dto.BasketDTO;
@Repository
public class BasketDAOImpl implements BasketDAO{
	
	@Autowired
	SqlSession sqlSession;

	
	
	@Override
	@Transactional
	public void update(BasketDTO bdto) throws Exception {
		sqlSession.update("basket.update",bdto);
		sqlSession.update("basket.updatedata",bdto);
		
	}

	@Override
	public List<BasketDTO> basketList(String bsuid) throws Exception {		
		return sqlSession.selectList("basket.basketList", bsuid);
	}

	@Override
	@Transactional
	public void insertBasket(BasketDTO bdto) throws Exception {
		sqlSession.insert("basket.insertbasket", bdto);
		sqlSession.insert("basket.insertbasketData", bdto);
	}

	@Override
	@Transactional
	public void deleteBasket(int bsnum) throws Exception {
		sqlSession.delete("basket.deleteBasket", bsnum);
		sqlSession.delete("basket.deleteBasketData", bsnum);
		
	}
	
}
