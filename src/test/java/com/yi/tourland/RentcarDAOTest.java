package com.yi.tourland;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.mng.RentcarVO;
import com.yi.tourland.persistance.mng.dao.RentcarDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RentcarDAOTest {
	
	@Autowired
	private RentcarDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert()throws Exception{
		RentcarVO vo = new RentcarVO();
		vo.setNo(2851);
		vo.setCdiv("L");
		vo.setCno("aa");
		vo.setRentddate("2020-05-01");
		vo.setReturndate("2020-05-04");
		dao.insertRentcar(vo);
	}
	
	
	

}
