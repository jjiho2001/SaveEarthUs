package com.seu.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.ReplyDAO;
import com.seu.app.vo.ReplyVO;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO dao;

	@Override
	public int replyInsert(ReplyVO vo) {
		
		return dao.replyInsert(vo);
	}

	@Override
	public List<ReplyVO> replyList(int no) {
		
		return dao.replyList(no);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		
		return dao.replyUpdate(vo);
	}

	@Override
	public int replyDelete(int reply_no, String userid) {
		
		return dao.replyDelete(reply_no, userid);
	}

	@Override
	public int replyCount(int no) {
		
		return dao.replyCount(no);
	}
}
