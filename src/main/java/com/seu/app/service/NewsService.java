package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.NewsVO;
import com.seu.app.vo.PagingVO;

public interface NewsService {
	
	// 목록 
	public List<NewsVO> newsList(PagingVO pVO);
	
	// 글등록 
	public int newsWriteOk(NewsVO vo);
	
	// select, view
	public NewsVO getNews(int no);
	
	// 글수정 
	public int newsEditOk(NewsVO vo);
	
	// 글삭제
	public int newsDel(int no, String userid);
	
	// hitcount
	public void hitCount(int no);
		
	// total record
	public int totalRecord(PagingVO pVO);
	
	// 여러개의 게코드 삭제
	public int newsMultiDel(NewsVO vo);
	
	
}
