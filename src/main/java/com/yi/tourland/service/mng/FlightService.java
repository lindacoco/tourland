package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;
import com.yi.tourland.persistance.mng.dao.FlightDAO;

@Service
public class FlightService {
	
	@Autowired
	private FlightDAO dao;
	
	public List<AirplaneVO> airplaneList(SearchCriteria cri) throws Exception{
		return dao.airplaneList(cri);
	}
	
	public int totalCountAirplane (SearchCriteria cri) throws Exception {
		return dao.totalCountAirplane(cri);
	}
}
