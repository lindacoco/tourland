package com.yi.tourland.persistance.mng.dao;

import java.sql.SQLException;
import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;

public interface FlightDAO {
	//항공편 전체 리스트
	public List<AirplaneVO> airplaneList(SearchCriteria cri) throws Exception;
	public List<AirplaneVO> airplaneListByDepature(SearchCriteria cri) throws Exception;
	public List<AirplaneVO> airplaneListByRending(SearchCriteria cri) throws Exception;
	//항공편 전체 숫자
	public int totalCountAirplane(SearchCriteria cri) throws Exception;
	public int totalCountAirplaneByDepature(SearchCriteria cri) throws Exception;
	public int totalCountAirplaneByRending(SearchCriteria cri) throws Exception;
	//항공 번호로 검색
	public AirplaneVO airplaneByNo(AirplaneVO vo) throws Exception;
	//항공 추가
	public void addAirplane(AirplaneVO vo) throws Exception;
	
}
  