package com.yi.tourland.persistance.mng.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.CouponVO;
import com.yi.tourland.persistance.mng.dao.CouponDAO;

@Repository
public class CouponDAOImpl implements CouponDAO {
	private static final String namespace = "mappers.mngMappers.CouponMapper.";  
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<CouponVO> couponList(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + "couponList", cri);
	}

	@Override
	public int totalCountCoupon(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + "totalCountCoupon", cri);
	}
}
