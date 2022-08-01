package com.shop.service;

import java.util.List;

import com.shop.dto.BoardDTO;
import com.shop.util.PageMaker;

public interface BoardService {
	public void insertBoard(BoardDTO bdto) throws Exception;
	public void updateBoard(BoardDTO bdto) throws Exception;
	public void deleteBoard(int bno) throws Exception;
	public List<BoardDTO> boardList() throws Exception;
	public BoardDTO getBoard(int bno) throws Exception;
	public int boardCount() throws Exception;
	public List<BoardDTO> boardPageList(PageMaker page) throws Exception;
}
