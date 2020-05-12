package com.yi.tourland.domain.mng;

import java.util.Date;

public class PlanBoardVO {
	private int no; // 문의사항 번호
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private String writer; // 게시글 작성자
	private Date regdate; // 작성날짜
	private String lcate; // 대분류
	private String mcate; // 중분류
	private int answer; // 답변여부
	private String respond; //답변내용

	public PlanBoardVO() {
		// 기본생성자
	}

	public PlanBoardVO(int no, String title, String content, String writer, Date regdate, String lcate, String mcate,
			int answer, String respond) {
		//다 받는 생성자
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.lcate = lcate;
		this.mcate = mcate;
		this.answer = answer;
		this.respond = respond;
	}



	// 밑으로 get, set, toString
	
	public int getNo() {
		return no;
	}

	public String getRespond() {
		return respond;
	}

	public void setRespond(String respond) {
		this.respond = respond;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getLcate() {
		return lcate;
	}

	public void setLcate(String lcate) {
		this.lcate = lcate;
	}

	public String getMcate() {
		return mcate;
	}

	public void setMcate(String mcate) {
		this.mcate = mcate;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "PlanBoardVO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", lcate=" + lcate + ", mcate=" + mcate + ", answer=" + answer + ", respond="
				+ respond + "]";
	}

}
