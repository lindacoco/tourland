package com.yi.tourland;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.mng.PopupVO;
import com.yi.tourland.persistance.mng.dao.PopupDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PopupDAOTest {
	@Autowired
	private PopupDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		PopupVO vo = new PopupVO();
		vo.setNo(1);
		vo.setTitle("첫번째");
		vo.setContent("으음");

		dao.insertPopup(vo);	
	}
	
	@Test
	public void test2ReadByNo() throws Exception{
		PopupVO vo = dao.readByNoPopup(1);
		System.out.println(vo);
	}
    
	@Test
	public void test3Update() throws Exception {
		PopupVO vo = dao.readByNoPopup(1);
		vo.setTitle("코코넛");	
		dao.updatePopup(vo);
		System.out.println(vo);
	}
	//@Test
	public void test4delete() throws Exception {
		dao.deletePopup(1);
	}
	
	@Test
	public void test5ListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(2);
		dao.listCriteriaPopup(cri);
	}
}
