package com.shop.myapp;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.dto.ProductDTO;
import com.shop.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	 @Autowired
	 ProductService productService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{
		List<ProductDTO> productList = productService.newproduct();
		List<ProductDTO> premiumList = productService.premiumList();
		List<ProductDTO> denimlist = productService.denimlist();
		List<ProductDTO> wovenlist = productService.wovenlist();
		List<ProductDTO> acclist = productService.acclist();
		model.addAttribute("productList", productList);
		model.addAttribute("premiumList", premiumList);
		model.addAttribute("denimlist", denimlist);
		model.addAttribute("wovenlist", wovenlist);
		model.addAttribute("acclist", acclist);
		return "home";
	}
	
}
