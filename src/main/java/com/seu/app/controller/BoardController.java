package com.seu.app.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import  com.seu.app.service.BoardService;
import  com.seu.app.service.ReplyService;
import  com.seu.app.vo.BoardVO;
import  com.seu.app.vo.PagingVO;

@RestController
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService service;

	ModelAndView mav = null; 
	// List
	@GetMapping("boardList")
	public ModelAndView boardList(PagingVO pvo, HttpServletRequest request) {
		mav = new ModelAndView();
		
		// 총 record 수
		pvo.setTotalRecord(service.totalRecord(pvo));
		
		String userid = request.getParameter("userid");
		pvo.setUserid(userid);
		
		// DB record 선택 - paging, 검색어
		
		mav.addObject("list", service.boardList(pvo));
		mav.addObject("pvo", pvo);
		
		mav.setViewName("board/boardList");
		return mav;
	}
	
	@GetMapping("boardForm")
	public ModelAndView boardForm() {
		mav = new ModelAndView();
		mav.setViewName("board/boardForm");
		return mav;
	}
	
	// write DB
	@PostMapping("boardFormOk")
	public ResponseEntity<String> boardFormOk(BoardVO vo, HttpServletRequest request){
		
		vo.setUserid((String)request.getSession().getAttribute("logId"));// session login id
		vo.setIp(request.getRemoteAddr());// 접속자의 ip
		
		String msg = "<script>";
		
		try {
			service.boardWriteOk(vo);
			msg += "location.href='/board/boardList';";
		} catch(Exception e) {
			msg += "alert('글 등록 실패');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	// view 
	@GetMapping("boardView")
	public ModelAndView boardView(@RequestParam("no") int no, PagingVO pvo) {
		
		// 조회수 증가
		service.hitCount(no);
		
		mav = new ModelAndView();
		mav.addObject("vo", service.getBoard(no));
		mav.addObject("pvo", pvo);
		mav.setViewName("board/boardView");
		
		return mav;
	}
	
	// edit
	@GetMapping("boardEdit/{num}")
	public ModelAndView boardEdit(@PathVariable("num") int no) {
		
		mav = new ModelAndView();
		
		mav.addObject("vo", service.getBoard(no));
		mav.setViewName("board/boardEdit");
		
		return mav;
	}
	
	// edit DB
	@PostMapping("boardEditOk")
	public ResponseEntity<String> boardEditOk(BoardVO vo, HttpSession session){
		
		// session id를 구함.
		vo.setUserid((String)session.getAttribute("logId"));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String msg = "<script>";
		
		try { // 성공
			service.boardEditOk(vo);
			msg += "alert('수정 ㅇㅇ');";
			msg += "location.href = '/board/boardView?no="+vo.getNo()+"';";
			
		} catch(Exception e) { // 실패
			e.printStackTrace();
			msg += "alert('수정 실패');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		
		return new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	}
	
	// delete
	@GetMapping("boardDel")
	public ModelAndView boardDel(int no, HttpSession session) {
		
		int cnt = service.boardDel(no, (String)session.getAttribute("logId"));
		mav = new ModelAndView();
		
		if(cnt > 0) {
			mav.setViewName("redirect:boardList");
		} else {
			mav.setViewName("redirect:boardView");
		}
		
		return mav;
	}
	
	// multi delete
	@PostMapping("multiDel")
	public ModelAndView multiDel(BoardVO vo) {
		
		int cnt = service.boardMultiDel(vo);
		
		mav = new ModelAndView();
		mav.setViewName("redirect:boardList");
		return mav;
	}
}
