package com.yi.tourland.persistance.mng.daoimpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.AirplaneVO;
import com.yi.tourland.persistance.mng.dao.FlightDAO;

@Repository
public class FlightDAOImpl implements FlightDAO {
	
	@Autowired
	private static final String namespace = "mappers.mngMappers.FlightMapper.";
	@Autowired
	private SqlSession sqlSession;
	       
	
	@Override
	public List<AirplaneVO> airplaneList(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + "airplaneList", cri);
	}

	@Override   
	public int totalCountAirplane(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + "totalCountAirplane", cri);
	}

	@Override
	public AirplaneVO airplaneByNo(AirplaneVO vo) throws SQLException {
		return sqlSession.selectOne(namespace + "airplaneByNo",vo);
	}

	@Override
	public List<AirplaneVO> airplaneListByDepature(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + "airplaneListByDepature",cri);
	}

	@Override
	public List<AirplaneVO> airplaneListByRending(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + "airplaneListByRending",cri);
	}

	@Override
	public int totalCountAirplaneByDepature(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + "totalCountAirplaneByDepature", cri);
	}

	@Override
	public int totalCountAirplaneByRending(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + "totalCountAirplaneByRending", cri);
	}
}
