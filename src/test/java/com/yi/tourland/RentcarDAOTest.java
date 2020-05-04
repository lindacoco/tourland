package com.yi.tourland;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.mng.EmployeeVO;
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
	@Test
	public void test2ReadByCno() throws Exception{
		List<RentcarVO> voList = dao.readByNoRentcarList("足立382-14");
		System.out.println(voList);

	}
	
	@Test
	public void test3Update() throws Exception {
		RentcarVO vo = dao.readByNoRentcarList("aa").get(0);
		vo.setCno("bb");
		dao.updateRentcar(vo);
		System.out.println(vo);
	}
	@Test
	public void test4delete() throws Exception {
		dao.deleteRentcar(2851);
	}
	
	@Test
	public void test5ListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(3); //다섯개만 
		dao.listCriteriaRentcar(cri);
	}
	
	

}
