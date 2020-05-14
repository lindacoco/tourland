package com.yi.tourland.domain;

public class SearchCriteria extends Criteria {
	private String searchType;
	private String searchType2;
	private String keyword;
	private String keyword2;
	private String keyword3;

	
	
	public String getKeyword3() {
		return keyword3;
	}

	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchType2() {
		return searchType2;
	}

	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", searchType2=" + searchType2 + ", keyword=" + keyword
				+ ", keyword2=" + keyword2 + ", keyword3=" + keyword3 + "]";
	}

	
}
