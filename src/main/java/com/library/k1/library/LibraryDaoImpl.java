package com.library.k1.library;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LibraryDaoImpl implements LibraryDao{

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void insertLibrary(LibraryVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("LIBRARY.LBINSERT", vo);
	}

	@Override
	public List<LibraryVO> selectAll(LibraryVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("LIBRARY.LBSELECTALL", vo);
	}

	@Override
	public LibraryVO selectOne(LibraryVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("LIBRARY.LBSELECTONE", vo);
	}

	@Override
	public void updateLibrary(LibraryVO vo) {
		// TODO Auto-generated method stub
		mybatis.update("LIBRARY.LBUPDATE", vo);
	}

	@Override
	public void deleteLibrary(LibraryVO vo) {
		// TODO Auto-generated method stub
		mybatis.delete("LIBRARY.LBDELETE",vo);
	}
	
}
