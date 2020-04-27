package com.yi.tourland.persistance.mng;

import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EmployeeVO;

public interface EmployeeDAO {
	 
	public void insert(EmployeeVO vo) throws Exception;
	public void update(EmployeeVO vo)throws Exception;
	public EmployeeVO readByNo(int empno)throws Exception;
	public void delete(int empno)throws Exception;
//	public List<EmployeeDAO> listPage(int page)throws Exception;
	public List<EmployeeDAO> listSearchCriteria(SearchCriteria cri)throws Exception;
	public int totalSearchCount(SearchCriteria cri) throws Exception;
	
	// 리플 기능 필요한 곳에서
	// public void updateReplyCnt(int amount, int bno)throws Exception;
	
}
