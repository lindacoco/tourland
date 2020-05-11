package com.yi.tourland.persistance.mng.dao;

import java.util.List;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EventVO;

public interface EventDAO {
	public void insertEvent(EventVO vo) throws Exception;
	public EventVO readByNoEvent(int no)throws Exception;
	public void updateEvent(EventVO vo)throws Exception;
	public void deleteEvent(int no)throws Exception;
	public List<EventVO> listCriteriaEvent(Criteria cri)throws Exception;
    public int totalCountEvent() throws Exception;
	public List<EventVO> listSearchCriteriaEvent(SearchCriteria cri)throws Exception;
	public int totalSearchCountEvent(SearchCriteria cri) throws Exception;

}
