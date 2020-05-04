package com.yi.tourland;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.mng.BannerVO;
import com.yi.tourland.persistance.mng.dao.BannerDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BannerDAOTest {
	
	@Autowired
	private BannerDAO dao;
	
	@Test
	public void testDAO() {
		System.out.println(dao);
	}
	
	@Test
	public void test1insert() throws Exception {
		BannerVO vo = new BannerVO();
		vo.setNo(7);
		vo.setTitle("다시한번");

		dao.insertBanner(vo);	
	}
	
	@Test
	public void test2ReadByNo() throws Exception{
		BannerVO vo = dao.readByNoBanner(2);
		System.out.println(vo);
	}
    
	@Test
	public void test3Update() throws Exception {
		BannerVO vo = dao.readByNoBanner(2);
		vo.setTitle("코코넛");	
		dao.updateBanner(vo);
		System.out.println(vo);
	}
	@Test
	public void test4delete() throws Exception {
		dao.deleteBanner(7);
	}
	
	@Test
	public void test5ListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(3);
		dao.listCriteriaBanner(cri);
	}
}
