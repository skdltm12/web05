package com.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dto.BasketDTO;
import com.shop.dto.PaymentDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<PaymentDTO> paymentAdminList() throws Exception {
		return sqlSession.selectList("payment.adminPaymentList");
	}

	@Override
	public List<PaymentDTO> paymentList(String userid) throws Exception {
		return sqlSession.selectList("payment.paymentList",userid);
	}

	@Override
	public void addPayment(PaymentDTO pdto) throws Exception {
		sqlSession.insert("payment.addpayment",pdto);
	}

	@Override
	public void paymentUpdate(PaymentDTO pdto) throws Exception {
		sqlSession.update("payment.updatePayment",pdto);
		
	}
	
	

	@Override
	public void basketclean(String pid1) throws Exception {
		sqlSession.delete("payment.basketclean", pid1);
		
	}

	@Override
	@Transactional
	public void deletebasket(PaymentDTO pdto) throws Exception {
		sqlSession.update("product.updateamount", pdto);
		sqlSession.update("product.updatebest", pdto);
	}

	@Override
	public void paymentDelete(int ono) throws Exception {
		sqlSession.delete("payment.deletePayment",ono);
	}

	@Override
	public List<BasketDTO> getPayment(String userid) throws Exception {
		return sqlSession.selectList("payment.getPayment",userid);
	}

	@Override
	public List<PaymentDTO> basketDataList(PaymentDTO pdto) throws Exception {
		return sqlSession.selectList("payment.basketDataList",pdto);
	}
	
	
	
}
