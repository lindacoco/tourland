package com.yi.tourland;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.mng.UserVO;
import com.yi.tourland.persistance.mng.dao.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UserDAOTest {
   
	@Autowired
	private UserDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		UserVO vo = new UserVO();
		vo.setUserno(9);
		vo.setUsername("다시한번");

		dao.insertUser(vo);
		System.out.println(vo);
	}
	
	@Test
	public void test2ReadByNo() throws Exception{
		UserVO vo = dao.readByNoUser(9);
		System.out.println(vo);
	}
    
	@Test
	public void test3Update() throws Exception {
		UserVO vo = dao.readByNoUser(9);
		vo.setUsername("코코넛");	
		dao.updateUser(vo);
		System.out.println(vo);
	}
	@Test
	public void test4delete() throws Exception {
		dao.deleteUser(9);
	}
	
	@Test
	public void test5ListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(3); //다섯개만 
		dao.listCriteriaUser(cri,0);
	}
	
}
