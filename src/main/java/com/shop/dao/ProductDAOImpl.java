package com.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.shop.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	ProductDAO productDao;
	
	
	@Override
	public List<ProductDTO> denimlist() throws Exception {
		return sqlSession.selectList("product.denimlist");
	}

	@Override
	public List<ProductDTO> wovenlist() throws Exception {
		return sqlSession.selectList("product.wovenlist");
	}

	@Override
	public List<ProductDTO> acclist() throws Exception {
		return sqlSession.selectList("product.acclist");
	}
	
	@Override
	public List<ProductDTO> premiumList() throws Exception {
		return sqlSession.selectList("product.premiumList");
	}

	@Override
	public List<ProductDTO> productList(String pid) throws Exception {
		return sqlSession.selectList("product.productList",pid);
	}

	@Override
	public ProductDTO productRead(String pid) throws Exception {
		return sqlSession.selectOne("product.productRead",pid);
	}

	@Override
	public void insertProduct(ProductDTO pdto) throws Exception {
		sqlSession.insert("product.insertProduct", pdto);
		
	}

	@Override
	public void updateProduct(ProductDTO pdto) throws Exception {
		sqlSession.update("product.updateProduct", pdto);
		
	}

	@Override
	public void deleteProduct(String pid) throws Exception {
		sqlSession.delete("product.deleteProduct", pid);
		
	}

	@Override
	public List<ProductDTO> newproduct() throws Exception {
		return sqlSession.selectList("product.newproduct");
	}

	
}
