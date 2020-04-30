package com.yi.tourland.persistance.mng;

import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.HotelVO;

public interface HotelDAO {
	public List<HotelVO> listHotel() throws Exception;
	public void insertHotel(HotelVO vo) throws Exception;
	public HotelVO readHotel(int no) throws Exception;
	public int updateHotel(HotelVO vo) throws Exception;
	public int deleteHotel(int no) throws Exception;
	public List<HotelDAO> listSearchHotel(SearchCriteria cri)throws Exception;
	public int totalSearchCountHotel(SearchCriteria cri) throws Exception;
}
