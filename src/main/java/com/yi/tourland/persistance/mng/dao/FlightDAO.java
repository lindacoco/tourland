package com.yi.tourland.persistance.mng.dao;

import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;

public interface FlightDAO {
	
	public List<AirplaneVO> airplaneList(SearchCriteria cri) throws Exception;
	public int totalCountAirplane(SearchCriteria cri) throws Exception;
}
  