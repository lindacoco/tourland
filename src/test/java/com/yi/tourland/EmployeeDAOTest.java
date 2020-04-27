package com.yi.tourland;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.mng.EmployeeVO;
import com.yi.tourland.persistance.mng.EmployeeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EmployeeDAOTest {
	
	@Autowired
	private EmployeeDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		EmployeeVO vo = new EmployeeVO();
		vo.setEmpno(6);
		vo.setEmpname("장장장");

		dao.insert(vo);		
	}
    
}
