package com.seu.app.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.seu.app.service.ManagerService;

@RestController
@RequestMapping("/manager/*")
public class ManagerController {

	@Inject
	ManagerService service;
	
	ModelAndView mav = null;
	
	@GetMapping("managerForm")
	public ModelAndView managerForm() {
		mav = new ModelAndView();
		
		mav.setViewName("manager/managerForm");
		return mav;
	}
}
