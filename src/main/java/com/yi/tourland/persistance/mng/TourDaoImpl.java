package com.yi.tourland.persistance.mng;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.TourVO;
@Repository
public class TourDaoImpl implements TourDao {
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.mngMappers.TourMapper.";
	@Override
	public List<TourVO> listPage(SearchCriteria cri) throws SQLException {
		return sqlSession.selectList(namespace + "listPage",cri);
	}

	@Override
	public TourVO selectTourByNo(TourVO vo) throws SQLException {
		return sqlSession.selectOne(namespace + "selectTourByNo",vo);
	}

	@Override
	public void insertTour(TourVO vo) throws SQLException {
		sqlSession.insert(namespace + "insertTour",vo);
	}

	@Override
	public void updateTour(TourVO vo) throws SQLException {
		sqlSession.update(namespace + "updateTour",vo);
	}

	@Override
	public void deleteTour(TourVO vo) throws SQLException {
		sqlSession.delete(namespace + "deleteTour",vo);
	}

	@Override
	public int totalCountBySearchCriteria(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(namespace + "totalCountBySearchCriteria",cri);
	}

	@Override
	public int totalCount() throws SQLException {
		return sqlSession.selectOne(namespace + "totalCount");
	}

}
