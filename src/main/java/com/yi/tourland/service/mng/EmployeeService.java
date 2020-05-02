package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.persistance.mng.EmployeeDAO;

@Service
public class EmployeeService {

	@Autowired
	EmployeeDAO dao;

	public void insertEmployee(EmployeeVO vo) throws Exception {
		dao.insertEmployee(vo);
	} 
	
	public void updateEmployee(EmployeeVO vo) throws Exception {
		dao.updateEmployee(vo);

	}
	
	public EmployeeVO readByNoEmployee(int empno) throws Exception {
		return dao.readByNoEmployee(empno);
	}
	
	public void deleteEmployee(int empno) throws Exception {
		dao.deleteEmployee(empno);

	}
	public List<EmployeeVO> listCriteriaEmployee(Criteria cri,int empretired) throws Exception {
		return dao.listCriteriaEmployee(cri, empretired);
	}
	
	public int totalCountEmployee(int empretired) throws Exception {
		return dao.totalCountEmployee(empretired);
	}
	
	public List<EmployeeVO> listSearchCriteriaEmployee(SearchCriteria cri, int empretired) throws Exception {
		return dao.listSearchCriteriaEmployee(cri, empretired);
	}
	
	public int totalSearchCountEmployee(SearchCriteria cri, int empretired) throws Exception {
		return dao.totalSearchCountEmployee(cri, empretired);
	}
}
