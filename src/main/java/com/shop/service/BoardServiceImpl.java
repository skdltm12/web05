package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.BoardDAO;
import com.shop.dto.BoardDTO;
import com.shop.util.PageMaker;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDao;
	
	@Override
	public void insertBoard(BoardDTO bdto) throws Exception {
		boardDao.insertBoard(bdto);
		
	}

	@Override
	public void updateBoard(BoardDTO bdto) throws Exception {
		boardDao.updateBoard(bdto);		
	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		boardDao.deleteBoard(bno);		
	}

	@Override
	public int boardCount() throws Exception {
		return boardDao.boardCount();
	}

	@Override
	public List<BoardDTO> boardPageList(PageMaker page) throws Exception {
		return boardDao.boardPageList(page);
	}

	@Override
	public List<BoardDTO> boardList() throws Exception {
		return boardDao.boardList();
	}

	@Override
	public BoardDTO getBoard(int bno) throws Exception {
		return boardDao.getBoard(bno);
	}
	
}
