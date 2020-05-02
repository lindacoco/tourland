package com.yi.tourland;

import java.sql.SQLException;
import java.util.Date;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.TourVO;
import com.yi.tourland.persistance.mng.dao.TourDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TourDaoTest {
	@Autowired
	private TourDao dao;
	@Test
	public void test01insertTour() throws SQLException {
		TourVO vo = new TourVO(3001, "테스트", "제주", new Date(), new Date(), "테스트", new Date(), 1, 1, true);
		dao.insertTour(vo);		
	}
	@Test
	public void test02selectTourByNo() throws SQLException {
		TourVO vo = new TourVO(3001);
		dao.selectTourByNo(vo);
	}
	@Test
	public void test03ListPage() throws SQLException {
		dao.listPage(new SearchCriteria());
	}
	@Test
	public void test04updateTour() throws SQLException {
		TourVO vo = new TourVO(3001, "테스트2", "일본", new Date(), new Date(), "테스트2", new Date(), 1, 1, false);
		dao.updateTour(vo);
	}
	@Test
	public void test05deleteTour() throws SQLException {
		TourVO vo = new TourVO(3001);
		dao.deleteTour(vo);
	}
	@Test
	public void test06TotalCount() throws SQLException {
		dao.totalCount();
	}
	@Test
	public void test07TotalCountBySearchCriteria() throws SQLException {
		SearchCriteria cri = new SearchCriteria();
		cri.setSearchType("date");
		cri.setKeyword("2020-04-01");
		dao.totalCountBySearchCriteria(cri);
	}
}
