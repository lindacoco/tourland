package com.yi.tourland.service.mng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.CouponVO;
import com.yi.tourland.persistance.mng.CouponDAO;

@Service
public class CouponService {
	
	@Autowired
	CouponDAO dao;
	
	public List<CouponVO> couponList(SearchCriteria cri) throws Exception{
		return dao.couponList(cri);
	}
	public int totalCountNotice (SearchCriteria cri) throws Exception {
		return dao.totalCountCoupon(cri);
	}
}
