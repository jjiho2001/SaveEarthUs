package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.ReplyVO;

public interface ReplyService {
	public int replyInsert(ReplyVO vo);
	public List<ReplyVO> replyList(int no);
	public int replyUpdate(ReplyVO vo);
	public int replyDelete(int reply_no, String userid);
	public int replyCount(int no);
}
