package com.yi.tourland.domain;

public class PageMaker {
	private int totalCount; // 게시글 전체
	private int startPage;
	private int endPage;
	private boolean prev; // 이전 여부
	private boolean next; // 이후 여부

	private int displayPageNum = 10; // 보여지는 페이지 번호의 수
	private Criteria cri;

	private void calcultorData() {
		//현재 페이지의 끝 번호를 구한다. 사용자가 15번을 선택함  제일 마지막 번호가 20이 되어야함.. 
		//15/10 = 1.5 올림이라서 2가 됨 *10 = 마지막 번호가 20으로 구해지게 됨 
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum))*displayPageNum;
		//현재 페이지의 시작번호 
		//끝번호 20 빼기 10 하고 나서 15번 이나오려면 11번부터 나와야하니깐 +1 
		startPage = (endPage - displayPageNum) +1;
		
		//실제 끝번호
		// 마지막 페이지에서 16번까지 있으면 16까지만 구해야하기때문에 
		//전체 개수가 153인데 / 10 하면 15.3 올림 16 
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
	    
		//만약에 실제 끝 번호 보다 가상 끝번호가 크면 실제 끝번호로 변경을 해준다  -- 첫페이지의 번호가 11이 나오도록 하려면 어쩔 수 없닷 
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		// 첫번째 시작 번호가 1이면 왼쪽으로 갈 곳이 있나용?? 없다! 그래서 false라서 왼쪽이 안나오게 되는 것 
		prev = (startPage == 1) ? false : true;
		// 160이 실제 게시글보다 153보다 크면 다음으로 넘어갈 번호가 없기 때문에 false 
		next = (endPage * cri.getPerPageNum() >= totalCount) ? false: true ;
	}
	
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcultorData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}

}
