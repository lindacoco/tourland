package com.yi.tourland.persistance.mng.dao;

import java.util.List;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.CustBoardVO;

public interface CustBoardDAO {
	
	public void insertCustBoard(CustBoardVO vo) throws Exception;
	public CustBoardVO readByNoCustBoard(int no)throws Exception;
	public void updateCustBoard(CustBoardVO vo)throws Exception;
	public void deleteCustBoard(int no)throws Exception;
	public List<CustBoardVO> listCriteriaCustBoard(Criteria cri)throws Exception;
    public int totalCountCustBoard() throws Exception;
	public List<CustBoardVO> listSearchCriteriaCustBoard(SearchCriteria cri)throws Exception;
	public int totalSearchCountCustBoard(SearchCriteria cri) throws Exception;
	
}
