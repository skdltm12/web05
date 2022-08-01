package com.shop.dao;

import java.util.List;

import com.shop.dto.ProductDTO;

public interface ProductDAO {
	public List<ProductDTO> productList(String pid) throws Exception;
	public ProductDTO productRead(String pid) throws Exception;
	public void insertProduct(ProductDTO pdto) throws Exception;
	public void updateProduct(ProductDTO pdto) throws Exception;
	public void deleteProduct(String pid) throws Exception;
	public List<ProductDTO> newproduct() throws Exception;
	public List<ProductDTO> premiumList() throws Exception;
	public List<ProductDTO> denimlist() throws Exception;
	public List<ProductDTO> wovenlist() throws Exception;
	public List<ProductDTO> acclist() throws Exception;
}
