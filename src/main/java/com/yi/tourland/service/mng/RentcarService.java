package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.RentcarVO;
import com.yi.tourland.persistance.mng.dao.RentcarDAO;

@Service
public class RentcarService {
    @Autowired
	RentcarDAO dao;
   
    
	public void insertRentcar(RentcarVO vo) throws Exception {
		dao.insertRentcar(vo);

	}
	
	public RentcarVO readByNo(int no) {
		return dao.readByNo(no);
	}
	
	public List<RentcarVO> readByNoRentcarList(String cno) throws Exception {
		return dao.readByNoRentcarList(cno);
		
	}

	
	public void updateRentcar(RentcarVO vo) throws Exception {
		dao.updateRentcar(vo);

	}

	
	public void deleteRentcar(int no) throws Exception {
		dao.deleteRentcar(no);

	}

	
	public List<RentcarVO> listCriteriaRentcar(Criteria cri) throws Exception {
		return dao.listCriteriaRentcar(cri);
	}

	
	public int totalCountRentcar() throws Exception {
		return dao.totalCountRentcar();
		
	}

	
	public List<RentcarVO> listSearchCriteriaRentcar(SearchCriteria cri) throws Exception {
		return dao.listSearchCriteriaRentcar(cri);
	}

	
	public int totalSearchCountRentcar(SearchCriteria cri) throws Exception {
		return dao.totalSearchCountRentcar(cri);
	}

}
