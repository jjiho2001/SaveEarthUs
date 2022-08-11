package com.seu.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seu.app.dao.QuestionDAO;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Inject
	QuestionDAO dao;
}
