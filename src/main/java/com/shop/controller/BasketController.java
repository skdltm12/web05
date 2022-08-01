package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.dto.BasketDTO;
import com.shop.service.BasketService;

@Controller
@RequestMapping("/basket/*")
public class BasketController {

	@Autowired
	HttpSession session;
	
	@Autowired
	BasketService basketService;
	
	@RequestMapping(value="list.do", method = RequestMethod.GET)
	public String basketList(@RequestParam String bsuid,Model model) throws Exception {
	List<BasketDTO> basketList = basketService.basketList(bsuid);
	model.addAttribute("basketList", basketList);
	return "basket/basketList";
	}
	
	@RequestMapping(value="addbasket.do", method = RequestMethod.POST)
	public String insertBasket(BasketDTO bdto ,Model model) throws Exception {
	basketService.insertBasket(bdto);
	return "redirect:list.do?bsuid="+bdto.getBsuid();
	}
	
	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String deleteBasket(int bsnum,String uid) throws Exception {
		basketService.deleteBasket(bsnum);
		return "redirect:/basket/list.do?bsuid="+uid;
	}	
	
	@RequestMapping(value="update.do", method = RequestMethod.POST)
		public String updateamount(BasketDTO bdto) throws Exception{
		basketService.update(bdto);		
			return "redirect:list.do?bsuid="+bdto.getBsuid();
		}
	
}
	 

