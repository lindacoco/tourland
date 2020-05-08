package com.yi.tourland;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;
import com.yi.tourland.domain.mng.HotelVO;
import com.yi.tourland.domain.mng.ProductVO;
import com.yi.tourland.domain.mng.RentcarVO;
import com.yi.tourland.domain.mng.TourVO;
import com.yi.tourland.persistance.mng.dao.ProductDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductDaoTest {
	@Autowired
	private ProductDao dao;
	@Test
	public void test01insertProduct() throws SQLException {
		ProductVO vo = new ProductVO(1, "테스트", "테스트", new Date(), 1, "사진없음", false);	
		dao.insertProduct(vo);
		
	}
	@Test
	public void test02insertpAirStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		AirplaneVO avo = new AirplaneVO();
		avo.setNo(1);
		dao.insertpAirStatus(pvo, avo);
		
	}

	@Test
	public void test03insertpHotelStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		HotelVO hvo = new HotelVO();
		hvo.setNo(1);
		dao.insertpHotelStatus(pvo, hvo);
	}

	@Test
	public void test04insertpTourStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		TourVO tvo = new TourVO(1);
		dao.insertpTourStatus(pvo, tvo);
	}

	@Test
	public void test05insertpRentcarStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		RentcarVO rvo = new RentcarVO();
		rvo.setNo(1);
		dao.insertpRentcarStatus(pvo, rvo);
	}
	@Test
	public void test06productByNo() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		pvo = dao.productByNo(pvo);
		System.out.println(pvo);
		for(AirplaneVO vo : pvo.getAir()) {
			System.out.println(vo);
		}
		for(HotelVO vo : pvo.getHotel()) {
			System.out.println(vo);
		}
		for(TourVO vo : pvo.getTour()) {
			System.out.println(vo);
		}
		for(RentcarVO vo : pvo.getRentcar()) {
			System.out.println(vo);
		}
	}

	@Test
	public void test07productListPage() throws SQLException {
		List<ProductVO> list = dao.productListPage(new SearchCriteria());
		for(ProductVO pvo : list) {
			System.out.println(pvo);
			for(AirplaneVO vo : pvo.getAir()) {
				System.out.println(vo);
			}
			for(HotelVO vo : pvo.getHotel()) {
				System.out.println(vo);
			}
			for(TourVO vo : pvo.getTour()) {
				System.out.println(vo);
			}
			for(RentcarVO vo : pvo.getRentcar()) {
				System.out.println(vo);
			}
		}
	}
	@Test
	public void test08totalCountBySearchProduct() throws SQLException {
		dao.totalCountBySearchProduct(new SearchCriteria());
	}

	@Test
	public void test09updateProduct() throws SQLException {
		ProductVO vo = new ProductVO(1, "테스트2", "테스트2", new Date(), 2, "사진있음", true);
		dao.updateProduct(vo);
	}

	@Test
	public void test10updatepAirStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		AirplaneVO avo = new AirplaneVO();
		avo.setNo(3);
		dao.updatepAirStatus(pvo, avo);
	}

	@Test
	public void test11updatepHotelStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		HotelVO hvo = new HotelVO();
		hvo.setNo(2);
		dao.updatepHotelStatus(pvo, hvo);
	}

	@Test
	public void test12updatepTourStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		TourVO tvo = new TourVO(2);
		dao.updatepTourStatus(pvo, tvo);
	}

	@Test
	public void test13updatepRentStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		RentcarVO rvo = new RentcarVO();
		rvo.setNo(2);
		dao.updatepRentStatus(pvo, rvo);
	}
	
	@Test
	public void test14deletepAirStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		AirplaneVO avo = new AirplaneVO();
		avo.setNo(3);
		dao.deletepAirStatus(pvo, avo);
	}

	@Test
	public void test15deletepHotelStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		HotelVO hvo = new HotelVO();
		hvo.setNo(2);
		dao.deletepHotelStatus(pvo, hvo);
	}

	@Test
	public void test16deletepTourStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		TourVO tvo = new TourVO(2);
		dao.deletepTourStatus(pvo, tvo);
	}

	@Test
	public void test17deletepRentStatus() throws SQLException {
		ProductVO pvo = new ProductVO(1);
		RentcarVO rvo = new RentcarVO();
		rvo.setNo(2);
		dao.deletepRentStatus(pvo, rvo);
	
	}

	@Test
	public void test18deleteProduct() throws SQLException {
		ProductVO vo = new ProductVO(1);
		dao.deleteProduct(vo);
	}
}
