package com.mvc.book.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.book.model.dto.BookeR;
import com.mvc.book.model.dto.BookeW;
import com.mvc.book.model.dto.Bookeserch;

public class BookeDaoImpl implements BookeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Bookeserch bserch(Bookeserch dto) {
		return null;
	}

	@Override
	public BookeW bookWanna(BookeW dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BookeR bookRead(BookeR dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
