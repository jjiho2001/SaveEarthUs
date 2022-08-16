package com.seu.app.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.DonateVO;

@Mapper
@Repository
public interface DonateDAO {
	
	// 후원 정보 등록 
	public int donateFormOk(DonateVO vo);
	
}
