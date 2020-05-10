package com.yi.tourland.persistance.mng.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EventVO;
import com.yi.tourland.persistance.mng.dao.EventDAO;
@Repository
public class EventDAOImpl implements EventDAO {
	private static final String namespace = "mappers.mngMappers.EventMapper.";

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void insertEvent(EventVO vo) throws Exception {
		sqlSession.insert(namespace+"insertEvent",vo);

	}

	@Override
	public EventVO readByNoEvent(int no) throws Exception {
		return sqlSession.selectOne(namespace+"readByNoEvent",no);
	}

	@Override
	public void updateEvent(EventVO vo) throws Exception {
		sqlSession.update(namespace+"updateEvent",vo);

	}

	@Override
	public void deleteEvent(int no) throws Exception {
		sqlSession.delete(namespace+"deleteEvent",no);

	}

	@Override
	public List<EventVO> listCriteriaEvent(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listCriteriaEvent", cri);
	}

	@Override
	public int totalCountEvent() throws Exception {
		return sqlSession.selectOne(namespace+"totalCountEvent");
	}

	@Override
	public List<EventVO> listSearchCriteriaEvent(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteriaEvent",cri);
	}

	@Override
	public int totalSearchCountEvent(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountEvent",cri);
	}

}
