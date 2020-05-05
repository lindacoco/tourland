package com.yi.tourland.persistance.mng.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.tourland.domain.SearchCriteria;
import com.yi.tourland.domain.mng.NoticeVO;
import com.yi.tourland.persistance.mng.dao.NoticeDAO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

private static final String namespace ="mappers.mngMappers.NoticeMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeVO> noticeList(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + "noticeList", cri);
	}

	@Override   
	public int totalCountNotice(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + "totalCountNotice", cri);
	}

	@Override
	public void addNotice(NoticeVO notice) throws Exception {
		sqlSession.insert(namespace+"addNotice", notice);
	}

	
	//번호로 공지사항 찾기

	@Override
	public NoticeVO readNoticeByNo(int no) throws Exception {
		return sqlSession.selectOne(namespace +"readNoticeByNo", no);
	}
	//공지사항 삭제
	@Override
	public void removeNotice(int no) throws Exception {
		sqlSession.delete(namespace + "removeNotice", no);
		
	}
	//공지사항 수정
	@Override
	public void editNotice(NoticeVO notice) throws Exception {
		sqlSession.update(namespace + "editNotice", notice);
		
	}

}
