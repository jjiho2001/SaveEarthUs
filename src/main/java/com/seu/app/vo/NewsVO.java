package com.seu.app.vo;

import java.util.List;

public class NewsVO {
	private int no;
	private String userid;
	private String subject;
	private String content;
	private int hit; 
	private String writedate;
	
	
	// 여러개의 레코드 번호를 저장할 컬렉션 선언 (뉴스 삭제용)
	private List<Integer> noList;

	
	@Override
	public String toString() {
		return "NewsVO [no=" + no + ", userid=" + userid + ", subject=" + subject + ", content=" + content + ", hit="
				+ hit + ", writedate=" + writedate + ", noList=" + noList + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public List<Integer> getNoList() {
		return noList;
	}

	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}


	
	
}
