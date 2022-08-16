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

import com.seu.app.service.NewsService;
import com.seu.app.vo.NewsVO;
import com.seu.app.vo.PagingVO;

@RestController
@RequestMapping("/news/*")
public class NewsController {
	
	@Autowired
	NewsService service;
	
	ModelAndView mav = null;
	
	// 뉴스목록 list 
	@GetMapping("newsList")
	public ModelAndView newsList(PagingVO pVO) {
		
		mav = new ModelAndView();
		
		// select DB record - page, search
		mav.addObject("list", service.newsList(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("news/newsList");
		return mav;
		
	}
	// 뉴스쓰기폼 
	@GetMapping("newsForm")
	public ModelAndView newsForm() {
		mav = new ModelAndView();
		mav.setViewName("news/newsForm");
		return mav;
	}
	
	// 뉴스쓰기 DB
	@PostMapping("newsWriteOk")
	public ResponseEntity<String> newsWriteOk(NewsVO vo, HttpServletRequest request){
		vo.setUserid((String)request.getSession().getAttribute("logId")); //세션 로그인 아이디
		
		String msg = "<script>";
		try {
			service.newsWriteOk(vo);
			msg += "location.href='/news/newsList';";
		}catch(Exception e) {
			msg += "alert('글등록이 실패하였습니다.');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
			
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		return entity;
	}
	
	
	// 뉴스 보기 
	@GetMapping("newsView")
	public ModelAndView newsView(@RequestParam("no")int no, PagingVO pVO) {
		// 조회수 증가
		service.hitCount(no);
			
		mav = new ModelAndView();
		mav.addObject("vo", service.getNews(no));
		mav.addObject("pVO", pVO);
		mav.setViewName("news/newsView");
		return mav;
		
	}
	
	// 뉴스 수정 폼
	@GetMapping("newsEdit/{num}")
	public ModelAndView newsEdit(@PathVariable("num") int no) {
	
		mav = new ModelAndView();
	
		mav.addObject("vo", service.getNews(no));
		mav.setViewName("news/newsEdit");
		
		return mav;
	}
	
	// 뉴스수정 DB
	@PostMapping("newsEditOk")
	public ResponseEntity<String> newsEditOk(NewsVO vo, HttpSession session){
		
		// 세션의 아이디를 구한다.
		vo.setUserid((String)session.getAttribute("logId"));
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset-UTF-8");
		String msg = "<script>";
		
		try {
			int cnt = service.newsEditOk(vo);
			System.out.println(cnt);
			
			// 수정되었을때 - 글내용보기 
			msg += "alert('글이 수정되었습니다. 글내용보기로 이동합니다.');";
			msg += "location.href='/news/newsView?no="+vo.getNo()+";";			
		
		}catch(Exception e) {
			e.printStackTrace();
			
			// 수정실패일때 - 수정으로 보내기 history 
			msg += "alert('글수정 실패하였습니다.');";
			msg += "history.go(-1);";
		}
		msg += "</script>";
		
		return new ResponseEntity<String>(msg,headers,HttpStatus.OK);
		
	}
	// 글삭제
		@GetMapping("newsDel")
		public ModelAndView newsDel(int no, HttpSession session) {
			int cnt = service.newsDel(no, (String)session.getAttribute("logId"));
			mav = new ModelAndView();
			if(cnt>0) {
				mav.setViewName("redirect:newsList");
			}else {
				mav.setViewName("redirect:newsView");
			}
			return mav;
		}
		// 여러개의 레코드 삭제
		@PostMapping("multiDel")
		public ModelAndView multiDel(NewsVO vo) {
			
			int cnt = service.newsMultiDel(vo);
			System.out.println("삭제 된 레코드수 : "+cnt);
			
			mav = new ModelAndView();
			mav.setViewName("redirect:newsList");
			return mav;
		}
	
}
