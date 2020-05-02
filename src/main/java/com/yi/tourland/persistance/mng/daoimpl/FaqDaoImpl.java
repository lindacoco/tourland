package com.yi.tourland.persistance.mng.daoimpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.FaqVO;
import com.yi.tourland.persistance.mng.dao.FaqDao;
@Repository
public class FaqDaoImpl implements FaqDao {
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "mappers.mngMappers.FaqMapper.";
	@Override
	public List<FaqVO> list() throws SQLException {
		return sqlSession.selectList(namespace + "list");
	}
	@Override
	public List<FaqVO> listPage(SearchCriteria cri) throws SQLException {
		return sqlSession.selectList(namespace + "listPage",cri);
	}

	@Override
	public FaqVO selectFAQByNo(FaqVO vo) throws SQLException {
		return sqlSession.selectOne(namespace + "selectFAQByNo",vo);
	}

	@Override
	public void insertFAQ(FaqVO vo) throws SQLException {
		sqlSession.insert(namespace + "insertFAQ",vo);
	}

	@Override
	public void updateFAQ(FaqVO vo) throws SQLException {
		sqlSession.update(namespace + "updateFAQ",vo);
	}

	@Override
	public void deleteFAQ(FaqVO vo) throws SQLException {
		sqlSession.delete(namespace + "deleteFAQ",vo);
	}
	@Override
	public int totalCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(namespace + "totalCount",cri);
	}
}
