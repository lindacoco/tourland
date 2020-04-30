package com.yi.tourland.persistance.mng;

import java.sql.SQLException;
import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.FaqVO;

public interface FaqDao {
	public List<FaqVO> list() throws SQLException;
	public List<FaqVO> listPage(SearchCriteria cri) throws SQLException;
	public FaqVO selectFAQByNo(FaqVO vo) throws SQLException;
	public void insertFAQ(FaqVO vo) throws SQLException;
	public void updateFAQ(FaqVO vo) throws SQLException;
	public void deleteFAQ(FaqVO vo) throws SQLException;
	public int totalCount() throws SQLException;
}
