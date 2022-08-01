package com.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.ProductDAO;
import com.shop.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductDAO productDao;
	SqlSession session;

	@Override
	public List<ProductDTO> denimlist() throws Exception {
		return productDao.denimlist();
	}

	@Override
	public List<ProductDTO> wovenlist() throws Exception {
		return productDao.wovenlist();
	}

	@Override
	public List<ProductDTO> acclist() throws Exception {
		return productDao.acclist();
	}
	
	@Override
	public List<ProductDTO> productList(String pid) throws Exception {
		return productDao.productList(pid);
	}

	@Override
	public ProductDTO productRead(String pid) throws Exception {
		return productDao.productRead(pid);
	}

	@Override
	public void insertProduct(ProductDTO pdto) throws Exception {
		productDao.insertProduct(pdto);		
	}

	@Override
	public void updateProduct(ProductDTO pdto) throws Exception {
		productDao.updateProduct(pdto);
		
	}

	@Override
	public void deleteProduct(String pid) throws Exception {
		productDao.deleteProduct(pid);
		
	}

	@Override
	public List<ProductDTO> newproduct() throws Exception {
		return productDao.newproduct();
	}

	@Override
	public List<ProductDTO> premiumList() throws Exception {
		return productDao.premiumList();
	}
}
