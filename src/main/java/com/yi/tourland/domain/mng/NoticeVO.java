package com.yi.tourland.domain.mng;

import java.util.Date;

public class NoticeVO {
	private int no;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
	
	
	
	
}
