package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.CustBoardVO;
import com.yi.tourland.persistance.mng.dao.CustBoardDAO;

@Service
public class CustBoardService {
	@Autowired
	private CustBoardDAO dao;
	
	
	public void insertCustBoard(CustBoardVO vo) throws Exception {
		dao.insertCustBoard(vo);
	}

	
	public CustBoardVO readByNoCustBoard(int no) throws Exception {
		return dao.readByNoCustBoard(no);
	}

	
	public void updateCustBoard(CustBoardVO vo) throws Exception {
		dao.updateCustBoard(vo);
	}

	
	public void deleteCustBoard(int no) throws Exception {
		dao.deleteCustBoard(no);
	}

	
	public List<CustBoardVO> listCriteriaCustBoard(Criteria cri) throws Exception {
		return dao.listCriteriaCustBoard(cri);
	}

	
	public int totalCountCustBoard() throws Exception {
		return dao.totalCountCustBoard();
	}

	
	public List<CustBoardVO> listSearchCriteriaCustBoard(SearchCriteria cri) throws Exception {
		return dao.listSearchCriteriaCustBoard(cri);
	}

	
	public int totalSearchCountCustBoard(SearchCriteria cri) throws Exception {
		return dao.totalSearchCountCustBoard(cri);
		
	}

}
