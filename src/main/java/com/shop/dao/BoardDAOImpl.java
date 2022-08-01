package com.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dto.BoardDTO;
import com.shop.util.PageMaker;
@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertBoard(BoardDTO bdto) throws Exception {
		sqlSession.insert("board.insertboard",bdto);		
	}

	
	@Override
	public List<BoardDTO> boardPageList(PageMaker page) throws Exception {
		return sqlSession.selectList("board.boardPageList", page);
	}


	@Override
	public int boardCount() throws Exception {
		return sqlSession.selectOne("board.boardCount");
	}


	@Override
	public void updateBoard(BoardDTO bdto) throws Exception {
		sqlSession.update("board.boardUpdate",bdto);
		
	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		sqlSession.delete("board.boardDelete",bno);
		
	}

	@Override
	public List<BoardDTO> boardList() throws Exception {
		return sqlSession.selectList("board.boardList");
	}

	@Override
	@Transactional
	public BoardDTO getBoard(int bno) throws Exception {
		sqlSession.update("board.viewcntUp", bno);
		return sqlSession.selectOne("board.getBoard",bno);
	}
	
}
