package com.seu.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.ManagerService;
import com.seu.app.service.ReportService;
import com.seu.app.vo.MemberVO;
import com.seu.app.vo.ReportPagingVO;
import com.seu.app.vo.ReportVO;

@RestController
@RequestMapping("/manager/*")
public class ManagerController {

	@Inject
	ManagerService service;
	
	@Inject
	ReportService rser;
	
	@Inject
	ReportController rcon;
	
	ModelAndView mav = null;
	
	@GetMapping("managerForm")
	public ModelAndView managerForm() {
		mav = new ModelAndView();
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		list = service.managerAllSelect();
		
		mav.addObject("managerList", list);
		
		mav.setViewName("manager/managerForm");
		return mav;
	}
	
	@GetMapping("managerSearch")
	public ModelAndView managerSearch(String userid) {
		mav = new ModelAndView();
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		if(userid != null && !userid.equals("")) {
			list = service.managerSearch(userid);
		}
		
		mav.addObject("userList", list);
		
		mav.setViewName("manager/managerSearch");
		return mav;
	}
	
	@PostMapping("managerInsert")
	public ModelAndView managerInsert(String userid, String username) {
		mav = new ModelAndView();
		
		int cnt = service.managerInsert(userid, username);
		
		mav.setViewName("redirect:/manager/managerForm");
		return mav; 
	}
	
	@GetMapping("managerDelete")
	public void managerDelete(String userid) {
		
		service.managerDelete(userid);
	}
	
	@GetMapping("managerReport")
	public ModelAndView managerReport(int category, ReportPagingVO prvo) {
		mav = new ModelAndView();
		
		mav = rcon.reportList(category, prvo, rser);
		mav.setViewName("manager/managerReport");
		return mav;
	}
	
	@GetMapping("managerReportWrite")
	public ModelAndView managerReportWrite() {
		mav = new ModelAndView();
		mav.setViewName("manager/managerReportWrite");
		return mav;
	}
	
	@PostMapping("managerReportWriteOk")
	public ResponseEntity<String> managerReportWriteOk(ReportVO rvo, HttpServletRequest request){
		return rcon.reportWriteOk(rvo, request, rser);
	}
	
	@GetMapping("managerReportView")
	public ModelAndView managerReportView(int no, ReportPagingVO prvo) {
		mav = new ModelAndView();
		mav.addObject("reportVO", rser.reportSelect(no));
		mav.addObject("prvo", prvo);
		mav.setViewName("manager/managerReportView");
		return mav;
	}
	
	@GetMapping("managerReportEdit/{no}")
	public ModelAndView managerReportEdit(@PathVariable("no") int no) {
		mav = new ModelAndView();
		mav.addObject("reportVO", rser.reportSelect(no));
		mav.setViewName("manager/managerReportEdit");
		return mav;
	}
	
	@PostMapping("managerReportEditOk")
	public ResponseEntity<String> managerReportEditOk(ReportVO rvo, HttpServletRequest request){
		return rcon.reportEditOk(rvo, request, rser);
	}
	
	@GetMapping("managerReportDelete/{no}")
	public ModelAndView managerReportDelete(@PathVariable("no") int no, HttpSession session) {
		return rcon.dataDelete(no, session, rser);
	}
}
