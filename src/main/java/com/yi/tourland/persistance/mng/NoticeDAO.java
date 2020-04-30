package com.yi.tourland.persistance.mng;

import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.NoticeVO;

public interface NoticeDAO {
	//공지사항 모든 리스트 불러오기
	public List<NoticeVO> noticeList(SearchCriteria cri) throws Exception;
	//공지사항 갯수
	public int totalCountNotice(SearchCriteria cri) throws Exception;
	
}
