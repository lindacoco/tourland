package com.yi.tourland;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.mng.CustBoardVO;
import com.yi.tourland.persistance.mng.dao.CustBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CustBoardDAOTest {
	
	@Autowired
	private CustBoardDAO dao;
	
	
	@Test
	public void test0TestDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		CustBoardVO vo = new CustBoardVO();
		vo.setNo(2);
		vo.setTitle("힘드로");
		vo.setContent("너두?나두");
		vo.setWriter("현서");
		vo.setPasswd("11");
		
		dao.insertCustBoard(vo);
	}
	
	@Test
	public void test2ReadByNo() throws Exception {
		
		CustBoardVO vo = dao.readByNoCustBoard(2);
	}
	
	@Test
	public void test3UpdateCustBoard() throws Exception {
		CustBoardVO vo = dao.readByNoCustBoard(2);
		vo.setTitle("냐냐");
		vo.setContent("후후");
		dao.updateCustBoard(vo);
	}
	
	@Test
	public void test4DeleteCustBoard() throws Exception {
		dao.deleteCustBoard(2);
	}
	
	
	@Test
	public void test5ListCriteria() throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPage(2);
		dao.listCriteriaCustBoard(cri);
	}
	
	
	
	
	
	
	
	
	

}
