package com.yi.tourland.persistance.mng;

import java.util.List;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.BannerVO;

public interface BannerDAO {
   
	public void insertBanner(BannerVO vo) throws Exception;
	public BannerVO readByNoBanner(int no)throws Exception;
	public void updateBanner(BannerVO vo)throws Exception;
	public void deleteBanner(int no)throws Exception;
	public List<BannerVO> listCriteriaBanner(Criteria cri)throws Exception;
    public int totalCountBanner() throws Exception;
	public List<BannerVO> listSearchCriteriaBanner(SearchCriteria cri)throws Exception;
	public int totalSearchCountBanner(SearchCriteria cri) throws Exception;
	
	// 리플 기능 필요한 곳에서
	// public void updateReplyCnt(int amount, int bno)throws Exception;

}
