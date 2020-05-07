package com.yi.tourland.service.mng;

import java.sql.SQLException;
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
	//항공편 전체 리스트
	public List<AirplaneVO> airplaneList(SearchCriteria cri) throws Exception{
		return dao.airplaneList(cri);
	}
	public List<AirplaneVO> airplaneListByDepature(SearchCriteria cri) throws Exception{
		return dao.airplaneListByDepature(cri);
	}
	public List<AirplaneVO> airplaneListByRending(SearchCriteria cri) throws Exception{
		return dao.airplaneListByRending(cri);
	}
	//항공편 전체 숫자
	public int totalCountAirplane (SearchCriteria cri) throws Exception {
		return dao.totalCountAirplane(cri);
	}
	public int totalCountAirplaneByDepature (SearchCriteria cri) throws Exception {
		return dao.totalCountAirplaneByDepature(cri);
	}
	public int totalCountAirplaneByRending (SearchCriteria cri) throws Exception {
		return dao.totalCountAirplaneByRending(cri);
	}
	//항공편 번호로 검색
	public AirplaneVO airplaneByNo(AirplaneVO vo) throws Exception {
		return dao.airplaneByNo(vo);
	}
	//항공 추가
	public void addAirplane(AirplaneVO vo) throws Exception{
		 dao.addAirplane(vo);
	}
}
