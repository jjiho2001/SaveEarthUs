package com.seu.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seu.app.dao.DonateDAO;
import com.seu.app.vo.DonateVO;


@Service
public class DonateServiceImpl implements DonateService {

	@Autowired
	DonateDAO dao;

	@Override
	public int donateFormOk(DonateVO vo) {
		
		return dao.donateFormOk(vo);
	}

	
	


}
