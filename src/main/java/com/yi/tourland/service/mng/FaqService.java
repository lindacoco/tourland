package com.yi.tourland.service.mng;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.FaqVO;
import com.yi.tourland.persistance.mng.FaqDao;

@Service
public class FaqService {
	@Autowired
	private FaqDao dao;
	public List<FaqVO> list() throws SQLException {
		return dao.list();
	}
	public List<FaqVO> listPage(SearchCriteria cri) throws SQLException {
		return dao.listPage(cri);
	}

	public FaqVO selectFAQByNo(FaqVO vo) throws SQLException {
		return dao.selectFAQByNo(vo);
	}

	public void insertFAQ(FaqVO vo) throws SQLException {
		dao.insertFAQ(vo);
	}

	public void updateFAQ(FaqVO vo) throws SQLException {
		dao.updateFAQ(vo);
	}

	public void deleteFAQ(FaqVO vo) throws SQLException {
		dao.deleteFAQ(vo);
	}
	public int totalCount(SearchCriteria cri) throws SQLException {
		return dao.totalCount(cri);
	}
}
