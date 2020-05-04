package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.NoticeVO;
import com.yi.tourland.persistance.mng.dao.NoticeDAO;

@Service
public class NoticeService {
	
	@Autowired
	NoticeDAO dao;
	
	public List<NoticeVO> noticeList(SearchCriteria cri) throws Exception{
		return dao.noticeList(cri);
	}
	
	public int totalCountNotice (SearchCriteria cri) throws Exception {
		return dao.totalCountNotice(cri);
	}
	
	public void addNotice (NoticeVO notice) throws Exception{
		dao.addNotice(notice);
	}
	
	//번호로 공지사항 찾기
	public NoticeVO readNoticeByNo (int no) throws Exception{
		NoticeVO notice = dao.readNoticeByNo(no);
		return notice;
	}
	
	//공지사항 삭제
	public void removeNotice(int no) throws Exception{
		dao.removeNotice(no);
	}
	//공지사항 수정
	public void editNotice(NoticeVO notice) throws Exception{
		dao.editNotice(notice);
	}
	
}
