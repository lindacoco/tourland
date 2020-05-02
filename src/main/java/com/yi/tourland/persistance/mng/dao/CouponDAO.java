package com.yi.tourland.persistance.mng.dao;

import java.util.List;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.CouponVO;

public interface CouponDAO {
	public List<CouponVO> couponList(SearchCriteria cri) throws Exception;
	public int totalCountCoupon(SearchCriteria cri) throws Exception;
}
