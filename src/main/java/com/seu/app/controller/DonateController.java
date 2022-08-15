package com.seu.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/donate/*")
public class DonateController {
	
	
	ModelAndView mav = null;
	
	// 후원창 
	@GetMapping("donateForm")
	public ModelAndView donateForm() {
		mav = new ModelAndView();
		mav.setViewName("donate/donateForm");
		return mav;
	}

}
