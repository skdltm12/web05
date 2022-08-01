package com.shop.controller;


import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shop.dto.DatabankDTO;
import com.shop.service.FileService;


@Controller
public class FileController {

	 	@Autowired
		FileService fileservice;
	 	
		@Autowired
		ResourceLoader rsloader;

		@RequestMapping(value="/uploadform.do")
		public String uploadform() {
			return "uploadfile";
		}
		
		
	@RequestMapping(value="/fileUpload.do", method=RequestMethod.POST)
	public String fileUpload(MultipartFile myfile) throws UnsupportedEncodingException, Exception{
		String filename = myfile.getOriginalFilename();
		filename = new String(filename.getBytes("8859_1"), "UTF-8");		
		Resource resource = rsloader.getResource("WEB-INF/views/upload");
		//myfile.transferTo(new File(resource.getFile().getCanonicalPath()+"/"+filename));
		myfile.transferTo(new File("D:\\yeo\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload", filename));
		return "redirect:/";
	}
	
	@RequestMapping(value="/uploadmulti.do")
	public String uploadmultiform() {
		return "uploadmulti";
	}
	
	@RequestMapping(value="/databank.do")
	public String databank() {
		return "databank";
	}
	
	@RequestMapping(value="/databankinsert.do")
	public String databankinsert(MultipartFile fileurl, HttpServletRequest request,Model model) throws IllegalStateException, Exception {
		String uploadFolder = "D:\\yeo\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
		String filename = fileurl.getOriginalFilename();
		File saveFile = new File(uploadFolder, filename);
		fileurl.transferTo(saveFile);
		DatabankDTO databank = new DatabankDTO();
		databank.setTitle(request.getParameter("title"));
		databank.setAuthor(request.getParameter("author"));
		databank.setFileurl(filename);
		fileservice.databankinsert(databank);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/multifileupload.do", method=RequestMethod.POST)
	public String multifileUpload(MultipartFile[] files) throws UnsupportedEncodingException, Exception{
		String uploadFolder = "D:\\yeo\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
		for(MultipartFile file : files) {
			String filename = file.getOriginalFilename();			
			
			File saveFile = new File(uploadFolder, filename);
			try {
				file.transferTo(saveFile);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/";
	}
	@RequestMapping(value="/databankList.do", method=RequestMethod.GET)
	public String databankList(DatabankDTO databank,Model model) throws Exception{
		List<DatabankDTO> databankList = fileservice.databankList();
		model.addAttribute("databankList", databankList);
		return "databankList";
	}
	
	@RequestMapping(value="/uploadAjaxForm.do", method=RequestMethod.GET)
	public String uaf() {
		return "uploadAjax";
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax.do", method=RequestMethod.POST)
	public String uaj(MultipartFile[] uploadFile, Model model) throws UnsupportedEncodingException{
		String uploadFolder = "D:\\yeo\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
		String result = "";
		for(MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);		
			
			File savaFile = new File(uploadFolder, uploadFileName);
			try {
				multipartFile.transferTo(savaFile);
				result = "파일 업로드 성공!";
			}catch(Exception e) {
				result = "파일 업로드 실패";
				e.printStackTrace();
			}
		}		
		return result;
	}

}