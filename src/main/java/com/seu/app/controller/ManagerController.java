package com.seu.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.ManagerService;
import com.seu.app.vo.MemberVO;

@RestController
@RequestMapping("/manager/*")
public class ManagerController {

	@Inject
	ManagerService service;
	
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
}
