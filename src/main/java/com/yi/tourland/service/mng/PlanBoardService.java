package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.PlanBoardVO;
import com.yi.tourland.persistance.mng.dao.PlanBoardDAO;

@Service
public class PlanBoardService {
	
	@Autowired
	private PlanBoardDAO dao;
	
	public void insertPlanBoard(PlanBoardVO vo) throws Exception {
		dao.insertPlanBoard(vo);

	}

	
	public PlanBoardVO readByNoPlanBoard(PlanBoardVO vo) throws Exception {
		return dao.readByNoPlanBoard(vo);
	}


	public void updatePlanBoard(PlanBoardVO vo) throws Exception {
		dao.updatePlanBoard(vo);
	}


	public void deletePlanBoard(PlanBoardVO vo) throws Exception {
		dao.deletePlanBoard(vo);

	}

	public List<PlanBoardVO> listCriteriaPlanBoard(Criteria cri) throws Exception {
		return dao.listCriteriaPlanBoard(cri);
	}

	
	public int totalCountPlanBoard() throws Exception {
		return dao.totalCountPlanBoard();

	}

	
	public List<PlanBoardVO> listSearchCriteriaPlanBoard(SearchCriteria cri) throws Exception {
		return dao.listSearchCriteriaPlanBoard(cri);
	}

	
	public int totalSearchCountPlanBoard(SearchCriteria cri) throws Exception {
		return dao.totalSearchCountPlanBoard(cri);
	}
}
