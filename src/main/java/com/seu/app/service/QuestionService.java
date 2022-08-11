package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.QuestionVO;

public interface QuestionService {

	public int qnaboardWriteOk(QuestionVO vo);

	public QuestionVO qnaboardview(int no);
	
	// List DB
	public List<QuestionVO> qnaboardlist();
}
