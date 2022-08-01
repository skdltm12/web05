package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.shop.dto.BoardDTO;
import com.shop.service.BoardService;
import com.shop.util.PageMaker;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
	public String deleteBoard(int bno) throws Exception{
		boardService.deleteBoard(bno);
		return "redirect:/board/pageList.do?curPage=1";
	}
	
	@RequestMapping(value="update.do", method=RequestMethod.POST)
	public String updateboard(BoardDTO bdto) throws Exception{
		boardService.updateBoard(bdto);
		return "redirect:/board/pageList.do?curPage=1";
	}
	
	@RequestMapping(value="editform", method=RequestMethod.GET)
	public String edit(int bno, Model model) throws Exception {
		BoardDTO boardEdit = boardService.getBoard(bno);
		model.addAttribute("boardEdit",boardEdit);	
		return "board/editform";
	}
	
	@RequestMapping(value="addboard.do", method = RequestMethod.POST)
	public String add(BoardDTO bdto, Model model) throws Exception {
		boardService.insertBoard(bdto);
		return "redirect:/board/pageList.do?curPage=1";
	}
	
	@RequestMapping(value="read.do", method = RequestMethod.GET)
	public String getBoard(@RequestParam int bno, Model model) throws Exception {
		BoardDTO boardRead = boardService.getBoard(bno);
		model.addAttribute("boardRead",boardRead);
		return "board/boardRead";
	}
	
	@RequestMapping(value="addform.do")
	public String boardList(Model model) throws Exception {
	return "board/addform";
	}
	
	@RequestMapping(value="pageList.do", method = RequestMethod.GET)
    public String boardPageList(@RequestParam("curPage") int curPage, Model model) throws Exception {
		int cnt = boardService.boardCount();
		//PageMaker page = new PageMaker(cnt, curPage);
		//PageMaker page = new PageMaker(cnt, curPage, 10);
		PageMaker page = new PageMaker(cnt, curPage, 10, 10);
		List<BoardDTO> boardPageList = boardService.boardPageList(page);
		model.addAttribute("boardPageList", boardPageList);
		model.addAttribute("page", page);
		model.addAttribute("cnt", cnt);
        return "board/boardList";
    }

	@ResponseBody
	@RequestMapping(value = "fileupload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            //String uploadPath = req.getSession().getServletContext().getRealPath("/views/upload"); //저장경로
			            String uploadPath = "D:\\yeo\\jsp3\\web05\\src\\main\\webapp\\resources\\upload";
			            //System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;			            
			            out = Files.newOutputStream(Paths.get(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            //String fileUrl = "/views/upload/"+fileName2+fileName;
			            String fileUrl = "D:\\yeo\\jsp3\\web05\\src\\main\\webapp\\resources\\upload\\"+fileName2+fileName; //url경로
			            //System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            //System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}
			}
		}
	}
}
	


