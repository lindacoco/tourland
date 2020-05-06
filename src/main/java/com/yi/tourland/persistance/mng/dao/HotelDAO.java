package com.yi.tourland.persistance.mng.dao;

import java.util.List;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.HotelVO;

public interface HotelDAO {
	public void insertHotel(HotelVO vo) throws Exception;
	public HotelVO readHotel(HotelVO vo) throws Exception;
	public int updateHotel(HotelVO vo) throws Exception;
	public int deleteHotel(HotelVO vo) throws Exception;
	
	
	public List<HotelVO> listCriteriaHotel(Criteria cri)throws Exception;
	public List<HotelVO> listSearchHotel(SearchCriteria cri)throws Exception;
    public int totalCountHotel() throws Exception;
	public int totalSearchCountHotel(SearchCriteria cri) throws Exception;
}
