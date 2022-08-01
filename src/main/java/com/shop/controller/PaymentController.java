package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.dao.PaymentDAO;
import com.shop.dto.BasketDTO;
import com.shop.dto.PaymentDTO;
import com.shop.service.BasketService;
import com.shop.service.PaymentService;


@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	@Autowired
	PaymentService paymentservice;
	
	@Autowired
	BasketService basketservice;
	
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public String paymentList(String userid, Model model) throws Exception{
		List<PaymentDTO>paymentList = paymentservice.paymentList(userid);
		model.addAttribute("paymentList", paymentList);
		return "payment/paymentList";
	}
	
	@RequestMapping(value="payform.do", method=RequestMethod.GET)
	public String payform(@RequestParam String bsuid,Model model) throws Exception{
		List<BasketDTO> basketList = basketservice.basketList(bsuid);
		model.addAttribute("basketList",basketList);
		return "payment/payform";
	}
	
	@RequestMapping(value="addpayment.do", method=RequestMethod.POST)
	public String addpayment(HttpServletRequest request,PaymentDTO pdto) throws Exception{
		String[] pid2 = (request.getParameterValues("pid"));
		String[] amount2 = (request.getParameterValues("amount"));
		String pid1 = request.getParameter("userid1");
		for(int i=0;i<pid2.length;i++) {
			int[] pid = new int[pid2.length];
			int[] amount = new int[amount2.length];
			pid[i] = Integer.parseInt(pid2[i]);
			amount[i] = Integer.parseInt(amount2[i]);
			pdto.setPid(pid[i]);
			pdto.setAmount(amount[i]);			
			paymentservice.deletebasket(pdto);
		}		
		pdto.setUserid(pid1);
		paymentservice.addPayment(pdto);
		paymentservice.basketclean(pid1);
		return "redirect:/";
	}
	
	@RequestMapping(value="update.do")
	public String paymentUpdate(String userid, PaymentDTO pdto) throws Exception{
		paymentservice.paymentUpdate(pdto);
		return "redirect:list.do?userid="+userid;		
	}
	
	@RequestMapping(value="basketDataList.do")
	public String basketDataList(PaymentDTO pdto, Model model, HttpServletRequest request) throws Exception{
		int searchkey1 = Integer.parseInt(request.getParameter("searchkey1"));
		int searchkey2 = Integer.parseInt(request.getParameter("searchkey2"));
		pdto.setSearchkey1(searchkey1);
		pdto.setSearchkey2(searchkey2);
		List<PaymentDTO> basketDataList = paymentservice.basketDataList(pdto);
		model.addAttribute("basketDataList",basketDataList);
		return "payment/basketDataList";		
	}
	
}
