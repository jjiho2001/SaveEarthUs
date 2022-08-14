package com.seu.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Inject
	ManagerDAO dao;
}
