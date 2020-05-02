package com.yi.tourland.service.mng;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.TourVO;
import com.yi.tourland.persistance.mng.TourDao;

@Service
public class TourService {
	@Autowired
	private TourDao dao;
	public List<TourVO> listPage(SearchCriteria cri) throws SQLException {
		return dao.listPage(cri);
	}
	public TourVO selectTourByNo(TourVO vo) throws SQLException {
		return dao.selectTourByNo(vo);
	}
	public void insertTour(TourVO vo) throws SQLException {
		dao.insertTour(vo);
	}
	public void updateTour(TourVO vo) throws SQLException {
		dao.updateTour(vo);
	}
	public void deleteTour(TourVO vo) throws SQLException {
		dao.deleteTour(vo);
	}
	public int totalCountBySearchCriteria(SearchCriteria cri) throws SQLException {
		return dao.totalCountBySearchCriteria(cri);
	}
	public int totalCount() throws SQLException {
		return dao.totalCount();
	}
}
