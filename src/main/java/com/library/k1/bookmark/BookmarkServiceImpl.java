package com.library.k1.bookmark;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookmarkServiceImpl implements BookmarkService{

	@Autowired
	BookmarkDao dao;

	@Override
	public void insert(BookmarkVO vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public List<BookmarkVO> selectAll(BookmarkVO vo) {
		// TODO Auto-generated method stub
		return dao.selectAll(vo);
	}

	@Override
	public BookmarkVO selectOne(BookmarkVO vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}

	@Override
	public void delete(BookmarkVO vo) {
		// TODO Auto-generated method stub
		dao.delete(vo);
	}

	@Override
	public String check(BookmarkVO vo) {
		// TODO Auto-generated method stub
		return dao.check(vo);
	}

	@Override
	public void deletelibrary(BookmarkVO vo) {
		// TODO Auto-generated method stub
		dao.deletelibrary(vo);
	}
}
