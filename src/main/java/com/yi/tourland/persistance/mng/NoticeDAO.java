package com.yi.tourland.persistance.mng;

import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.NoticeVO;

public interface NoticeDAO {
	//공지사항 모든 리스트 불러오기
	public List<NoticeVO> noticeList(SearchCriteria cri) throws Exception;
	//공지사항 갯수
	public int totalCountNotice(SearchCriteria cri) throws Exception;
	//공지사항 추가
	public void addNotice(NoticeVO notice) throws Exception; 
	//번호로 공지사항 찾기
	public NoticeVO readNoticeByNo(int no) throws Exception;
	//공지사항 삭제
	public void removeNotice (int no) throws Exception;
}
