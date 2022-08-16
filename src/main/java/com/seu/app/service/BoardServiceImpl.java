package com.seu.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seu.app.dao.BoardDAO;
import com.seu.app.vo.BoardVO;
import com.seu.app.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;

	@Override
	public List<BoardVO> boardList(PagingVO pvo) {
		
		return dao.boardList(pvo);
	}

	@Override
	public int boardWriteOk(BoardVO vo) {
		
		return dao.boardWriteOk(vo);
	}

	@Override
	public BoardVO getBoard(int no) {
		
		return dao.getBoard(no);
	}

	@Override
	public int boardEditOk(BoardVO vo) {
		
		return dao.boardEditOk(vo);
	}

	@Override
	public int boardDel(int no, String userid) {
		
		return dao.boardDel(no, userid);
	}

	@Override
	public void hitCount(int no) {
		dao.hitCount(no);
	}

	@Override
	public int totalRecord(PagingVO pvo) {
		
		return dao.totalRecord(pvo);
	}

	@Override
	public int boardMultiDel(BoardVO vo) {
		
		return dao.boardMultiDel(vo);
	}
}

