package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.HotelVO;
import com.yi.tourland.persistance.mng.dao.HotelDAO;

@Service
public class HotelService {
	@Autowired
	HotelDAO dao;
	
	public void insertHotel(HotelVO vo) throws Exception{
		dao.insertHotel(vo);
	}
	public HotelVO readHotel(HotelVO vo) throws Exception{
		return dao.readHotel(vo);
	}
	public void updateHotel(HotelVO vo) throws Exception{
		dao.updateHotel(vo);
	}
	public void deleteHotel(HotelVO vo) throws Exception{
		dao.deleteHotel(vo);
	}

	/* 호텔의 전체 리스트 */
	public List<HotelVO> listCriteriaHotel(Criteria cri) throws Exception {
		return dao.listCriteriaHotel(cri);
	}

	/* 검색했을때 결과값의 리스트 */
	public List<HotelVO> listSearchHotel(SearchCriteria cri) throws Exception{
		return dao.listSearchHotel(cri);
	}

	/* 호텔의 전체 상품 수 */ 
	public int totalCountHotel() throws Exception {
		return dao.totalCountHotel();
	}

	/* 검색했을때 상품의 전체 개수 */
	public int totalSearchCountHotel(SearchCriteria cri) throws Exception {
		return dao.totalSearchCountHotel(cri);
	}
}	
