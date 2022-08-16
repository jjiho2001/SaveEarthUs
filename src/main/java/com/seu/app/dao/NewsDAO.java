package com.seu.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.NewsVO;
import com.seu.app.vo.PagingVO;

@Mapper
@Repository
public interface NewsDAO {
	// 글 목록 
	public List<NewsVO> newsList(PagingVO pVO);
	
	// 글등록 
	public int newsWriteOk(NewsVO vo);
	
	// 글 선택, 글내용보기 
	public NewsVO getNews(int no);
	
	// 글수정 
	public int newsEditOk(NewsVO vo);
	
	// 글삭제
	public int newsDel(int no, String userid);
	
	// 조회수 
	public void hitCount(int no);
	
	// 총레코드수 
	public int totalRecord(PagingVO pVO);
	
	// 여러개의 게코드 삭제
	public int newsMultiDel(NewsVO vo);
	
}
