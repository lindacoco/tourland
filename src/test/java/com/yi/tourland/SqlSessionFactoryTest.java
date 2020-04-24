package com.yi.tourland;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class SqlSessionFactoryTest {
	@Autowired
	private SqlSessionFactory sqlfactory;
	
	@Test
	public void testSqlSessionFactory() {
		System.out.println(sqlfactory);
	}
}
