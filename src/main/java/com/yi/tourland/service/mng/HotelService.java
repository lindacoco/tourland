package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.HotelVO;
import com.yi.tourland.persistance.mng.HotelDAO;

@Service
public class HotelService {
	@Autowired
	HotelDAO dao;
	
	public void insertHotel(HotelVO vo) throws Exception{
		dao.insertHotel(vo);
	}
	public HotelVO readHotel(int no) throws Exception{
		return dao.readHotel(no);
	}
	public void updateHotel(HotelVO vo) throws Exception{
		dao.updateHotel(vo);
	}
	public void deleteHotel(int no) throws Exception{
		dao.deleteHotel(no);
	}
	
	public List<HotelVO> listCriteriaHotel(Criteria cri) throws Exception {
		return dao.listCriteriaHotel(cri);
	}

	public List<HotelVO> listSearchHotel(SearchCriteria cri) throws Exception{
		return dao.listSearchHotel(cri);
	}

	public int totalCountHotel() throws Exception {
		return dao.totalCountHotel();
	}
	
	public int totalSearchCountHotel(SearchCriteria cri) throws Exception {
		return dao.totalSearchCountHotel(cri);
	}



}	
