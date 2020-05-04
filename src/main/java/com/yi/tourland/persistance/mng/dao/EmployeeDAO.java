package com.yi.tourland.persistance.mng.dao;

import java.util.List;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EmployeeVO;

public interface EmployeeDAO {
	 
	public void insertEmployee(EmployeeVO vo) throws Exception;
	public EmployeeVO readByNoEmployee(int empno)throws Exception;
	public void updateEmployee(EmployeeVO vo)throws Exception;
	public void deleteEmployee(int empno)throws Exception;
	public List<EmployeeVO> listCriteriaEmployee(Criteria cri, int empretired)throws Exception;
    public int totalCountEmployee(int empretired) throws Exception;
	public List<EmployeeVO> listSearchCriteriaEmployee(SearchCriteria cri, int empretired)throws Exception;
	public int totalSearchCountEmployee(SearchCriteria cri, int empretired) throws Exception;
	
	//아이디 체크를 위해 생성
	public EmployeeVO readByIdEmployee(String empid)throws Exception;
	// 리플 기능 필요한 곳에서
	// public void updateReplyCnt(int amount, int bno)throws Exception;
	
}
