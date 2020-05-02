package com.yi.tourland.persistance.mng;

import java.sql.SQLException;
import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.TourVO;

public interface TourDao {
	public List<TourVO> listPage(SearchCriteria cri) throws SQLException;
	public TourVO selectTourByNo(TourVO vo) throws SQLException;
	public void insertTour(TourVO vo) throws SQLException;
	public void updateTour(TourVO vo) throws SQLException;
	public void deleteTour(TourVO vo) throws SQLException;
	public int totalCount() throws SQLException;
	public int totalCountBySearchCriteria(SearchCriteria cri) throws SQLException;
}
