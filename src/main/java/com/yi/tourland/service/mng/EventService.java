package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EventVO;
import com.yi.tourland.persistance.mng.dao.EventDAO;
@Service
public class EventService {

	@Autowired
	EventDAO dao;
	
	
	public void insertEvent(EventVO vo) throws Exception {
		dao.insertEvent(vo);

	}

	public EventVO readByNoEvent(int no) throws Exception {
		return dao.readByNoEvent(no);
	}

	
	public void updateEvent(EventVO vo) throws Exception {
		dao.updateEvent(vo);

	}

	
	public void deleteEvent(int no) throws Exception {
		dao.deleteEvent(no);

	}

	
	public List<EventVO> listCriteriaEvent(Criteria cri) throws Exception {
		return dao.listCriteriaEvent(cri);
	}

	
	public int totalCountEvent() throws Exception {
		return dao.totalCountEvent();
	}

	
	public List<EventVO> listSearchCriteriaEvent(SearchCriteria cri) throws Exception {
		return dao.listSearchCriteriaEvent(cri);
	}

	
	public int totalSearchCountEvent(SearchCriteria cri) throws Exception {
		return dao.totalSearchCountEvent(cri);
	}
	
	public List<EventVO> eventListDependsTime(String times) {
		return dao.eventListDependsTime(times);
	}
}
