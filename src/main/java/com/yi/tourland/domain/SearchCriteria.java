package com.yi.tourland.domain;

public class SearchCriteria extends Criteria {
	private String searchType;
	private String searchType2;
	private String keyword;

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

	@Override
	public String toString() {
		return String.format("SearchCriteria [searchType=%s, searchType2=%s, keyword=%s]", searchType, searchType2,
				keyword);
	}

}
