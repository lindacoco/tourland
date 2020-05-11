package com.yi.tourland;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.mng.EventVO;
import com.yi.tourland.persistance.mng.dao.EventDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EventDAOTest {
	@Autowired
	private EventDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		EventVO vo = new EventVO();
		vo.setNo(4);
		vo.setTitle("첫번째");
		vo.setContent("으음");

		dao.insertEvent(vo);	
	}
	
	@Test
	public void test2ReadByNo() throws Exception{
		EventVO vo = dao.readByNoEvent(1);
		System.out.println(vo);
	}
    
	@Test
	public void test3Update() throws Exception {
		EventVO vo = dao.readByNoEvent(1);
		vo.setTitle("코코넛");	
		dao.updateEvent(vo);
		System.out.println(vo);
	}
	//@Test
	public void test4delete() throws Exception {
		dao.deleteEvent(1);
	}
	
	@Test
	public void test5ListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(2);
		dao.listCriteriaEvent(cri);
	}
}
