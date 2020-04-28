package com.yi.tourland.persistance.mng;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EmployeeVO;
@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	
	private static final String namespace ="mappers.mgnMappers.EmployeeMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertEmployee(EmployeeVO vo) throws Exception {
		sqlSession.insert(namespace+"insert",vo);

	}

	@Override
	public void update(EmployeeVO vo) throws Exception {
		sqlSession.update(namespace+"update",vo);

	}

	@Override
	public EmployeeVO readByNo(int empno) throws Exception {
		return sqlSession.selectOne(namespace+"readByNo", empno);
	}

	@Override
	public void delete(int empno) throws Exception {
		sqlSession.delete(namespace+"delete",empno);

	}

	@Override
	public List<EmployeeDAO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteria",cri);
	}

	@Override
	public int totalSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCount",cri);
	}

}
