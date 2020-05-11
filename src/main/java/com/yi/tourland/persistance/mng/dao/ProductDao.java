package com.yi.tourland.persistance.mng.dao;

import java.sql.SQLException;
import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;
import com.yi.tourland.domain.mng.HotelVO;
import com.yi.tourland.domain.mng.ProductVO;
import com.yi.tourland.domain.mng.RentcarVO;
import com.yi.tourland.domain.mng.TourVO;

public interface ProductDao {
	public List<ProductVO> productListPage(SearchCriteria cri) throws SQLException;
	public ProductVO productByNo(ProductVO vo) throws SQLException;
	public void insertProduct(ProductVO vo) throws SQLException;
	public void insertpAirStatus(ProductVO pvo, AirplaneVO avo) throws SQLException;
	public void insertpHotelStatus(ProductVO pvo, HotelVO hvo) throws SQLException;
	public void insertpTourStatus(ProductVO pvo, TourVO tvo) throws SQLException;
	public void insertpRentcarStatus(ProductVO pvo, RentcarVO rvo) throws SQLException;
	public void updateProduct(ProductVO vo) throws SQLException;
	public void updatepAirStatus(ProductVO pvo, AirplaneVO avo) throws SQLException;
	public void updatepHotelStatus(ProductVO pvo, HotelVO hvo) throws SQLException;
	public void updatepTourStatus(ProductVO pvo, TourVO tvo) throws SQLException;
	public void updatepRentStatus(ProductVO pvo, RentcarVO rvo) throws SQLException;
	public void deletepAirStatus(ProductVO pvo) throws SQLException;
	public void deletepHotelStatus(ProductVO pvo) throws SQLException;
	public void deletepTourStatus(ProductVO pvo) throws SQLException;
	public void deletepRentStatus(ProductVO pvo) throws SQLException;
	public void deleteProduct(ProductVO vo) throws SQLException;
	public int totalCountBySearchProduct(SearchCriteria cri) throws SQLException;
}
