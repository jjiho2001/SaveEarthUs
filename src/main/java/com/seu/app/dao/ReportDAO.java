package com.seu.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.seu.app.vo.ReportVO;

@Mapper
@Repository
public interface ReportDAO {
	public List<ReportVO> reportAllSelect();
	public int reportInsert(ReportVO rvo);
	public ReportVO reportSelect(int no);
	public void hitUpdate(int no);
	public String getFilename(int no);
	public int reportUpdate(ReportVO rvo);
	public int reportDelete(int no);
}
