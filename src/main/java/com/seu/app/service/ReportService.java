package com.seu.app.service;

import java.util.List;

import com.seu.app.vo.ReportVO;

public interface ReportService {
	public List<ReportVO> reportAllSelect();
	public int reportInsert(ReportVO rvo);
	public ReportVO reportSelect(int no);
	public void hitUpdate(int no);
	public String getFilename(int no);
	public int reportUpdate(ReportVO rvo);
	public int reportDelete(int no);
}
