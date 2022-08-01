package com.shop.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.dto.ProductDTO;
import com.shop.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	 @Autowired
	 ProductService productService;
	
	@RequestMapping("addform.do")
	public String addform() {
		return "product/addform";
	}
	

	@RequestMapping(value="add.do", method = RequestMethod.POST)
	public String add(MultipartFile pimg,HttpServletRequest request, Model model) throws IllegalStateException, Exception {
		String uploadFolder = "D:\\yeo\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
		String filename = pimg.getOriginalFilename(); 
		File saveFile = new File(uploadFolder, filename);
		pimg.transferTo(saveFile);
		ProductDTO pdto = new ProductDTO();
		pdto.setPid(Integer.parseInt(request.getParameter("pid")));
		pdto.setPname(request.getParameter("pname"));
		pdto.setPprice(Integer.parseInt(request.getParameter("pprice")));
		pdto.setPdcprice(Integer.parseInt(request.getParameter("pdcprice")));
		pdto.setPimg(filename);
		pdto.setPcolor(request.getParameter("pcolor"));
		pdto.setPsize(Integer.parseInt(request.getParameter("psize")));
		pdto.setPamount(Integer.parseInt(request.getParameter("pamount")));
		pdto.setBest(Integer.parseInt(request.getParameter("best")));
		pdto.setPremium(Integer.parseInt(request.getParameter("premium")));
		pdto.setDc(Integer.parseInt(request.getParameter("dc")));
		productService.insertProduct(pdto);
		return "redirect:/";
	}
	
	@RequestMapping(value="list.do", method = RequestMethod.GET)
	public String productList(String pid, Model model) throws Exception {
		model.addAttribute("pcode",pid);
		if(pid.equals("20")) {
			String pid1="12";
			List<ProductDTO> productList = productService.productList(pid1);
			model.addAttribute("productList", productList);
			return "product/productList";
		}else if(pid.equals("24")) {
			String pid1="14";
			List<ProductDTO> productList = productService.productList(pid1);
			model.addAttribute("productList", productList);
			return "product/productList";
		}else if(pid.equals("30")) {
			String pid1="10";
			List<ProductDTO> productList = productService.productList(pid1);
			model.addAttribute("productList", productList);
			return "product/productList";
		}else {
			List<ProductDTO> productList = productService.productList(pid);
			model.addAttribute("productList", productList);
			return "product/productList";
		}		
	}
	
	@RequestMapping(value="read.do", method = RequestMethod.GET)
	public String productRead(@RequestParam String pid, Model model) throws Exception {
		ProductDTO productRead = productService.productRead(pid);
		model.addAttribute("productRead", productRead);		
		return "product/productRead";
	}
	
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String productUpdate(ProductDTO pdto, Model model) throws Exception {
		productService.updateProduct(pdto);
		return "redirect:/";
	}
	
	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String productDelete(String pid, Model model) throws Exception {
		productService.deleteProduct(pid);
		return "redirect:/";
	}
	
	
	}
