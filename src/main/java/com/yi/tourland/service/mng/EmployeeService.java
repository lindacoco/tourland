package com.yi.tourland.service.mng;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.persistance.mng.EmployeeDAO;

@Service
public class EmployeeService {

	@Autowired
	EmployeeDAO dao;

	public void insert(EmployeeVO vo) throws Exception {
		dao.insertEmployee(vo);
	} 
	
	
	
}
