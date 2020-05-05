package com.yi.tourland.persistance.mng.dao;

import java.util.List;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.RentcarVO;

public interface RentcarDAO {
	
	
	public void insertRentcar(RentcarVO vo) throws Exception;
	public List<RentcarVO> readByNoRentcarList(String cno)throws Exception;
	public void updateRentcar(RentcarVO vo)throws Exception;
	public void deleteRentcar(int no)throws Exception;
	public List<RentcarVO> listCriteriaRentcar(Criteria cri)throws Exception;
    public int totalCountRentcar() throws Exception;
	public List<RentcarVO> listSearchCriteriaRentcar(SearchCriteria cri)throws Exception;
	public int totalSearchCountRentcar(SearchCriteria cri) throws Exception;
	


}
