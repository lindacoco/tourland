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
		sqlSession.insert(namespace+"insertEmployee",vo);

	}

	@Override
	public void updateEmployee(EmployeeVO vo) throws Exception {
		sqlSession.update(namespace+"updateEmployee",vo);

	}

	@Override
	public EmployeeVO readByNoEmployee(int empno) throws Exception {
		return sqlSession.selectOne(namespace+"readByNoEmployee", empno);
	}

	@Override
	public void deleteEmployee(int empno) throws Exception {
		sqlSession.delete(namespace+"deleteEmployee",empno);

	}

	@Override
	public List<EmployeeDAO> listSearchCriteriaEmployee(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteriaEmployee",cri);
	}

	@Override
	public int totalSearchCountEmployee(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountEmployee",cri);
	}

}
