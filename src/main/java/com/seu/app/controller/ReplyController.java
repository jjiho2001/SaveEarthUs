package com.seu.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import  com.seu.app.service.ReplyService;
import  com.seu.app.vo.ReplyVO;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@PostMapping("replyWrite")
	public int replyWrite(ReplyVO vo, HttpSession session) {
		
		vo.setUserid((String)session.getAttribute("logId"));
		
		System.out.println(vo.toString());
		return service.replyInsert(vo);
	}
	
	// 댓글 목록 선택
	@GetMapping("replyList")
	public List<ReplyVO> replyList(int no) {
		return service.replyList(no);
	}
	
	// 댓글 수정
	@PostMapping("replyEdit")
	public int replyEdit(ReplyVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		return service.replyUpdate(vo);
	}
	
	// 댓글 삭제
	@GetMapping("replyDel")
	public int replyDel(int reply_no, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		return service.replyDelete(reply_no, userid);
	}
}
