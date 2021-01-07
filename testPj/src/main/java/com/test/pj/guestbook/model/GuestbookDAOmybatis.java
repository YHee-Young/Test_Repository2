package com.test.pj.guestbook.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestbookDAOmybatis implements GuestbookDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.guestbook.";
	@Override
	public int insertGbook(GuestbookVO vo) {
		return sqlSession.insert(namespace+"insertGbook",vo);
	}

		
}
