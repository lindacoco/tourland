package com.yi.tourland.persistance.mng.dao;

import java.sql.SQLException;
import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;

public interface FlightDAO {
	public List<AirplaneVO> airplaneList(SearchCriteria cri) throws Exception;
	public List<AirplaneVO> airplaneListByDepature(SearchCriteria cri) throws Exception;
	public List<AirplaneVO> airplaneListByRending(SearchCriteria cri) throws Exception;
	public int totalCountAirplane(SearchCriteria cri) throws Exception;
	public int totalCountAirplaneByDepature(SearchCriteria cri) throws Exception;
	public int totalCountAirplaneByRending(SearchCriteria cri) throws Exception;
	public AirplaneVO airplaneByNo(AirplaneVO vo) throws SQLException;
}
  