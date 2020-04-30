package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<HotelVO> listHotel() throws Exception{
		return dao.listHotel();
	}
	public void updateHotel(HotelVO vo) throws Exception{
		dao.updateHotel(vo);
	}
	public void deleteHotel(int no) throws Exception{
		dao.deleteHotel(no);
	}
}	
