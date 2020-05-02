package com.yi.tourland;

import java.sql.SQLException;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.mng.FaqVO;
import com.yi.tourland.persistance.mng.dao.FaqDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class FaqDaoTest {
	@Autowired
	private FaqDao dao;
	@Test
	public void test01insertFaq() throws SQLException {
		FaqVO vo = new FaqVO("테스트","테스트","t","t");
		dao.insertFAQ(vo);
	}
	@Test
	public void test02selectFaqByNo() throws SQLException {
		FaqVO vo = new FaqVO();
		vo.setNo(86);
		dao.insertFAQ(vo);
	}
	@Test
	public void test02selectList() throws SQLException {
		dao.list();
	}
	@Test
	public void test03updateFaq() throws SQLException {
		FaqVO vo = new FaqVO(86,"테스트2","t2","t2");
		dao.updateFAQ(vo);
	}
	@Test
	public void test04deleteFaq() throws SQLException {
		FaqVO vo = new FaqVO();
		vo.setNo(86);
		dao.deleteFAQ(vo);
	}
}
