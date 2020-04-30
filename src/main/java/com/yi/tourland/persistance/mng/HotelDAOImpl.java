package com.yi.tourland.persistance.mng;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.HotelVO;

@Repository
public class HotelDAOImpl implements HotelDAO {
	
	public static final String namespace = "mappers.hotelMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertHotel(HotelVO vo) throws Exception {
		sqlSession.insert(namespace + "insertHotel", vo);
	}

	@Override
	public HotelVO readHotel(int no) throws Exception {
		return sqlSession.selectOne(namespace + "readHotel",no);
	}

	@Override
	public int updateHotel(HotelVO vo) throws Exception {
		return sqlSession.update(namespace+"updateHotel",vo);
	}

	@Override
	public int deleteHotel(int no) throws Exception {
		return sqlSession.delete(namespace+"deleteHotel", no);
	}

	@Override
	public List<HotelVO> listHotel() throws Exception {
		return sqlSession.selectList(namespace+"listHotel");

	}

	@Override
	public List<HotelDAO> listSearchHotel(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace+"listSearchHotel",cri);
	}

	@Override
	public int totalSearchCountHotel(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace+"totalSearchCountHotel",cri);
	}


}
