package com.yi.tourland.persistance.mng;

import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EmployeeVO;

public interface EmployeeDAO {
	 
	public void insertEmployee(EmployeeVO vo) throws Exception;
	public void updateEmployee(EmployeeVO vo)throws Exception;
	public EmployeeVO readByNoEmployee(int empno)throws Exception;
	public void deleteEmployee(int empno)throws Exception;
//	public List<EmployeeDAO> listPage(int page)throws Exception;
	public List<EmployeeDAO> listSearchCriteriaEmployee(SearchCriteria cri)throws Exception;
	public int totalSearchCountEmployee(SearchCriteria cri) throws Exception;
	
	// 리플 기능 필요한 곳에서
	// public void updateReplyCnt(int amount, int bno)throws Exception;
	
}
