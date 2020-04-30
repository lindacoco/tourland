package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.NoticeVO;
import com.yi.tourland.persistance.mng.NoticeDAO;

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
	
}
