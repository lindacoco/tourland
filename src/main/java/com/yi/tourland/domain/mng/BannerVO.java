package com.yi.tourland.domain.mng;

public class BannerVO {
	private int no;
	private String title;
	private String content;
	private String pic;
	private int isSetting;

	

	@Override
	public String toString() {
		return "BannerVO [no=" + no + ", title=" + title + ", content=" + content + ", pic=" + pic + ", isSetting="
				+ isSetting + "]";
	}
	
	

	public int getIsSetting() {
		return isSetting;
	}


	public void setIsSetting(int isSetting) {
		this.isSetting = isSetting;
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

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}



}
