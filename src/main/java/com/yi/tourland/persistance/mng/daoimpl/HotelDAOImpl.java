package com.yi.tourland.persistance.mng.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.Criteria;
import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.HotelVO;
import com.yi.tourland.persistance.mng.dao.HotelDAO;

@Repository
public class HotelDAOImpl implements HotelDAO {
	
	public static final String namespace = "mappers.mngMappers.hotelMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertHotel(HotelVO vo) throws Exception {
		sqlSession.insert(namespace + "insertHotel", vo);
	}

	@Override
	public HotelVO readHotel(HotelVO vo) throws Exception {
		return sqlSession.selectOne(namespace + "readHotel",vo);
	}

	@Override
	public int updateHotel(HotelVO vo) throws Exception {
		return sqlSession.update(namespace+"updateHotel",vo);
	}

	@Override
	public int deleteHotel(HotelVO vo) throws Exception {
		return sqlSession.delete(namespace+"deleteHotel", vo);
	}

	@Override
	public List<HotelVO> listCriteriaHotel(Criteria cri) throws Exception {
		
		
		return sqlSession.selectList(namespace+"listCriteriaHotel",cri);
	}
	@Override
	public int totalCountHotel() throws Exception {
		return sqlSession.selectOne(namespace+"totalCountHotel");
	}
	
	@Override
	public List<HotelVO> listSearchHotel(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchHotel",cri);
	}

	@Override
	public int totalSearchCountHotel(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountHotel",cri);
	}
}
