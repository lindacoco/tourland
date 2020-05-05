package com.yi.tourland.persistance.mng.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.CustBoardVO;
import com.yi.tourland.persistance.mng.dao.CustBoardDAO;

@Repository
public class CustBoardImpl implements CustBoardDAO {
	
	private static final String namespace ="mappers.mngMappers.CustBoardMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertCustBoard(CustBoardVO vo) throws Exception {
		sqlSession.insert(namespace+"insertCustBoard",vo);

	}

	@Override
	public CustBoardVO readByNoCustBoard(int no) throws Exception {
		return sqlSession.selectOne(namespace+"readByNoCustBoard", no);
	}

	@Override
	public void updateCustBoard(CustBoardVO vo) throws Exception {
		sqlSession.update(namespace+"updateCustBoard",vo);

	}

	@Override
	public void deleteCustBoard(int no) throws Exception {
		sqlSession.delete(namespace+"deleteCustBoard",no);

	}

	@Override
	public List<CustBoardVO> listCriteriaCustBoard(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listCriteriaRentcar", cri);
	}

	@Override
	public int totalCountCustBoard() throws Exception {
		return sqlSession.selectOne(namespace+"totalCountCustBoard");
	}

	@Override
	public List<CustBoardVO> listSearchCriteriaCustBoard(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteriaCustBoard", cri);
	}

	@Override
	public int totalSearchCountCustBoard(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountCustBoard",cri);
	}

}
