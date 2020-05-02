package com.yi.tourland.persistance.mng.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.BannerVO;
import com.yi.tourland.persistance.mng.dao.BannerDAO;
@Repository
public class BannerDAOImpl implements BannerDAO {

	private static final String namespace ="mappers.mngMappers.BannerMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public void insertBanner(BannerVO vo) throws Exception {
		sqlSession.insert(namespace+"insertBanner",vo);

	}

	@Override
	public BannerVO readByNoBanner(int no) throws Exception {
		return sqlSession.selectOne(namespace+"readByNoBanner",no);
	}

	@Override
	public void updateBanner(BannerVO vo) throws Exception {
		sqlSession.update(namespace+"updateBanner",vo);

	}

	@Override
	public void deleteBanner(int no) throws Exception {
		sqlSession.delete(namespace+"deleteBanner",no);

	}

	@Override
	public List<BannerVO> listCriteriaBanner(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listCriteriaBanner", cri);
	}

	@Override
	public int totalCountBanner() throws Exception {
		return sqlSession.selectOne(namespace+"totalCountBanner");
	}

	@Override
	public List<BannerVO> listSearchCriteriaBanner(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchCriteriaBanner",cri);
	}

	@Override
	public int totalSearchCountBanner(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountBanner",cri);
	}

}
