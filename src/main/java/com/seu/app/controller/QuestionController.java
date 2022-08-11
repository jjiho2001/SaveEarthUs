package com.seu.app.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.QuestionService;
import com.seu.app.vo.QuestionVO;

@Controller
public class QuestionController {
	@Inject
	QuestionService service;
	
	ModelAndView mav = null; 

	// QNA글목록
	@RequestMapping("/qnaboard/list")
	public ModelAndView questionList() {
		ModelAndView mav = new ModelAndView();

		// DB조회

		mav.setViewName("qnaboard/qnaList");

		return mav;
	}

	// 질문글 작성폼
	@RequestMapping("/qnaboard/write")
	public String qnaboardWrite() {
		return "qnaboard/qnaWrite";
	}
	// 질문글 작성 DB
	//@RequestMapping(value="/qnaboard/writeOk", method=RequestMethod.POST)
	//public ____ qnaboardWriteOk(QuestionVO vo, HttpServletRequest request) {
	
		//vo.setIp(request.getRemoteAddr());
		
		//HttpSession session = request.getSession();
		//String userid = (String)session.getAttribute("logId");
		//vo.setUserid(userid);
	//}


}
