package com.shop.dao;

import java.util.List;

import com.shop.dto.BasketDTO;
import com.shop.dto.PaymentDTO;

public interface PaymentDAO {
	public List<PaymentDTO> paymentAdminList() throws Exception;
	public List<PaymentDTO> paymentList(String userid) throws Exception;
	public void addPayment(PaymentDTO pdto) throws Exception;
	public void paymentUpdate(PaymentDTO pdto) throws Exception; 
	public void paymentDelete(int ono) throws Exception;
	public List<BasketDTO> getPayment(String userid) throws Exception;
	public void deletebasket(PaymentDTO pdto) throws Exception;
	public void basketclean(String pid1) throws Exception;
	public List<PaymentDTO> basketDataList(PaymentDTO pdto) throws Exception;
}
