package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.PaymentDAO;
import com.shop.dto.BasketDTO;
import com.shop.dto.PaymentDTO;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	PaymentDAO paymentDao;
	
	@Override
	public List<PaymentDTO> paymentAdminList() throws Exception {
		return paymentDao.paymentAdminList();
	}




	@Override
	public List<PaymentDTO> basketDataList(PaymentDTO pdto) throws Exception {
		return paymentDao.basketDataList(pdto);
	}



	@Override
	public List<PaymentDTO> paymentList(String userid) throws Exception {
		return paymentDao.paymentList(userid);
	}

	@Override
	public void addPayment(PaymentDTO pdto) throws Exception {
		paymentDao.addPayment(pdto);
		
	}

	
	
	@Override
	public void basketclean(String pid1) throws Exception {
		paymentDao.basketclean(pid1);
		
	}

	@Override
	public void deletebasket(PaymentDTO pdto) throws Exception {
		paymentDao.deletebasket(pdto);		
	}

	@Override
	public void paymentUpdate(PaymentDTO pdto) throws Exception {
		paymentDao.paymentUpdate(pdto);		
	}

	@Override
	public void paymentDelete(int ono) throws Exception {
		paymentDao.paymentDelete(ono);		
	}

	@Override
	public List<BasketDTO> getPayment(String userid) throws Exception {
		return paymentDao.getPayment(userid);
	}	
}
