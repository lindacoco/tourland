package com.yi.tourland.persistance.mng.dao;

import java.util.List;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.PlanBoardVO;

public interface PlanBoardDAO {
	public void insertPlanBoard(PlanBoardVO vo) throws Exception;
	public PlanBoardVO readByNoPlanBoard(PlanBoardVO vo)throws Exception;
	public void updatePlanBoard(PlanBoardVO vo)throws Exception;
	public void deletePlanBoard(PlanBoardVO vo)throws Exception;
	public List<PlanBoardVO> listCriteriaPlanBoard(Criteria cri)throws Exception;
    public int totalCountPlanBoard() throws Exception;
	public List<PlanBoardVO> listSearchCriteriaPlanBoard(SearchCriteria cri)throws Exception;
	public int totalSearchCountPlanBoard(SearchCriteria cri) throws Exception;
}
