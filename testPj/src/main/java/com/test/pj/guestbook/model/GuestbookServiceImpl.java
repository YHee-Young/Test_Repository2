package com.test.pj.guestbook.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuestbookServiceImpl implements GuestbookService{
	@Autowired
	private GuestbookDAO dao;

	@Override
	public int insertGbook(GuestbookVO vo) {
		return dao.insertGbook(vo);
	}
	
	
	
}
