package com.seu.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seu.app.dao.NewsDAO;
import com.seu.app.vo.NewsVO;
import com.seu.app.vo.PagingVO;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	NewsDAO dao;

	@Override
	public List<NewsVO> newsList(PagingVO pVO) {
	
		return dao.newsList(pVO);
	}

	@Override
	public NewsVO getNews(int no) {
		
		return dao.getNews(no);
		
	}

	@Override
	public void hitCount(int no) {
		
		dao.hitCount(no);
		
	}

	@Override
	public int totalRecord(PagingVO pVO) {

		return dao.totalRecord(pVO);
	}

	@Override
	public int newsWriteOk(NewsVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int newsEditOk(NewsVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
