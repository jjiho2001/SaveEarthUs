package com.seu.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import  com.seu.app.vo.BoardVO;
import  com.seu.app.vo.PagingVO;

@Mapper
@Repository
public interface BoardDAO {
	
	// List DB
	public List<BoardVO> boardList(PagingVO pvo);
	
	// Write DB
	public int boardWriteOk(BoardVO vo);
	
	// View DB
	public BoardVO getBoard(int no);
	
	// Edit DB
	public int boardEditOk(BoardVO vo);
	
	// Delete DB
	public int boardDel(int no, String userid);
	
	// 조회수
	public void hitCount(int no);
	
	// 총 record 수
	public int totalRecord(PagingVO pvo);
	
	// Multi delete
	public int boardMultiDel(BoardVO vo);
}
