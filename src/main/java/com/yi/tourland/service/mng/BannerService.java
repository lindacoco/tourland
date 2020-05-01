package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.BannerVO;
import com.yi.tourland.persistance.mng.BannerDAO;

@Service
public class BannerService {

	@Autowired
	BannerDAO dao;
	
	public void insertBanner(BannerVO vo) throws Exception {
		dao.insertBanner(vo);

	}

	
	public BannerVO readByNoBanner(int no) throws Exception {
		return dao.readByNoBanner(no);
		
	}

	
	public void updateBanner(BannerVO vo) throws Exception {
		dao.updateBanner(vo);

	}

	
	public void deleteBanner(int no) throws Exception {
		dao.deleteBanner(no);

	}

	
	public List<BannerVO> listCriteriaBanner(Criteria cri) throws Exception {
		return dao.listCriteriaBanner(cri);
		
	}

	
	public int totalCountBanner() throws Exception {
		return dao.totalCountBanner();
		
	}

	
	public List<BannerVO> listSearchCriteriaBanner(SearchCriteria cri) throws Exception {
		return dao.listSearchCriteriaBanner(cri);
		
	}

	
	public int totalSearchCountBanner(SearchCriteria cri) throws Exception {
		return dao.totalSearchCountBanner(cri);
		
	}
}
