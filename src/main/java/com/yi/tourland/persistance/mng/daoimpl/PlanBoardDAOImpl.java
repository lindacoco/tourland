package com.yi.tourland.persistance.mng.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.PlanBoardVO;
import com.yi.tourland.persistance.mng.dao.PlanBoardDAO;

@Repository
public class PlanBoardDAOImpl implements PlanBoardDAO {
	private static final String namespace ="mappers.mngMappers.PlanBoardMapper.";

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertPlanBoard(PlanBoardVO vo) throws Exception {
		sqlSession.insert(namespace+"insertPlanBoard",vo);

	}

	@Override
	public PlanBoardVO readByNoPlanBoard(PlanBoardVO vo) throws Exception {
		return sqlSession.selectOne(namespace+"readByNoPlanBoard", vo);

	}

	@Override
	public void updatePlanBoard(PlanBoardVO vo) throws Exception {
		sqlSession.update(namespace+"updatePlanBoard",vo);

	}

	@Override
	public void deletePlanBoard(PlanBoardVO vo) throws Exception {
		sqlSession.delete(namespace+"deletePlanBoard",vo);

	}

	@Override
	public List<PlanBoardVO> listCriteriaPlanBoard(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listCriteriaPlanBoard", cri);

	}

	@Override
	public int totalCountPlanBoard() throws Exception {
		return sqlSession.selectOne(namespace+"totalCountPlanBoard");

	}

	@Override
	public List<PlanBoardVO> listSearchCriteriaPlanBoard(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteriaPlanBoard", cri);

	}

	@Override
	public int totalSearchCountPlanBoard(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountPlanBoard",cri);

	}

}
