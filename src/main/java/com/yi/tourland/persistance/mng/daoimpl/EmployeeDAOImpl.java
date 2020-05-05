package com.yi.tourland.persistance.mng.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.persistance.mng.dao.EmployeeDAO;
@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	
	private static final String namespace ="mappers.mngMappers.EmployeeMapper.";
	
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
	public List<EmployeeVO> listCriteriaEmployee(Criteria cri,int empretired) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("empretired",empretired);
		return sqlSession.selectList(namespace+"listCriteriaEmployee", map);
	}


	@Override
	public int totalCountEmployee(int empretired) throws Exception {
		return sqlSession.selectOne(namespace+"totalCountEmployee", empretired);
	}
	

	@Override
	public List<EmployeeVO> listSearchCriteriaEmployee(SearchCriteria cri, int empretired) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		map.put("empretired",empretired);
		
		return sqlSession.selectList(namespace+"listSearchCriteriaEmployee",map);
	}

	@Override
	public int totalSearchCountEmployee(SearchCriteria cri, int empretired) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri",cri);
		//System.out.println(cri);
		map.put("empretired",empretired);
		//System.out.println(empretired);
		return sqlSession.selectOne(namespace+"totalSearchCountEmployee",map);
	}

	//아이디 중복 체크 위함 
	@Override
	public EmployeeVO readByIdEmployee(String empid) throws Exception {
		return sqlSession.selectOne(namespace+"readByIdEmployee",empid);
	}

	
	
	

}
