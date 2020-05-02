package com.yi.tourland.domain.mng;

public class FaqVO {
	private int no;
	private String title;
	private String content;
	private String lcate;
	private String mcate;
	
	public FaqVO() {
		
	}
	
	
	public FaqVO(int no, String content, String lcate, String mcate) {
		this.no = no;
		this.content = content;
		this.lcate = lcate;
		this.mcate = mcate;
	}


	public FaqVO(String title, String content, String lcate, String mcate) {
		this.title = title;
		this.content = content;
		this.lcate = lcate;
		this.mcate = mcate;
	}

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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	@Override
	public String toString() {
		return String.format("FaqVO [no=%s, title=%s, content=%s, lcate=%s, mcate=%s]", no, title, content, lcate,
				mcate);
	}
	
}
