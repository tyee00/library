package com.library.k1.library;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LibraryServiceImpl implements LibraryService{
	@Autowired
	LibraryDao dao;

	@Override
	public void insertLibrary(LibraryVO vo) {
		// TODO Auto-generated method stub
		dao.insertLibrary(vo);
	}

	@Override
	public List<LibraryVO> selectAll(LibraryVO vo) {
		// TODO Auto-generated method stub
		return dao.selectAll(vo);
	}

	@Override
	public LibraryVO selectOne(LibraryVO vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}

	@Override
	public void updateLibrary(LibraryVO vo) {
		// TODO Auto-generated method stub
		dao.updateLibrary(vo);
	}

	@Override
	public void deleteLibrary(LibraryVO vo) {
		// TODO Auto-generated method stub
		dao.deleteLibrary(vo);
	}
	
}
