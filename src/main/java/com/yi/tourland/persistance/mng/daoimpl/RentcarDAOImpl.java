package com.yi.tourland.persistance.mng.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.RentcarVO;
import com.yi.tourland.persistance.mng.dao.RentcarDAO;
@Repository
public class RentcarDAOImpl implements RentcarDAO {

    private static final String namespace ="mappers.mngMappers.RentcarMapper.";
		
    @Autowired
    private SqlSession sqlSession;
	
	@Override
	public void insertRentcar(RentcarVO vo) throws Exception {
		sqlSession.insert(namespace+"insertRentcar",vo);

	}
	@Override
	public RentcarVO readByNo(int no) {
		return sqlSession.selectOne(namespace + "readByNo",no);
	}

	@Override
	public List<RentcarVO> readByNoRentcarList(String cno) throws Exception {
		return sqlSession.selectList(namespace+"readByNoRentcarList", cno);
		
	}

	@Override
	public void updateRentcar(RentcarVO vo) throws Exception {
		sqlSession.update(namespace+"updateRentcar",vo);

	}

	@Override
	public void deleteRentcar(int no) throws Exception {
		sqlSession.delete(namespace+"deleteRentcar",no);

	}

	@Override
	public List<RentcarVO> listCriteriaRentcar(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listCriteriaRentcar", cri);
	}

	@Override
	public int totalCountRentcar() throws Exception {
		return sqlSession.selectOne(namespace+"totalCountRentcar");
		
	}

	@Override
	public List<RentcarVO> listSearchCriteriaRentcar(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteriaRentcar", cri);	}

	@Override
	public int totalSearchCountRentcar(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountRentcar",cri);
	}
}
