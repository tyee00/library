package com.library.k1.bookmark;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDaoImpl implements BookmarkDao{

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void insert(BookmarkVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("BOOKMARK.BMINSERT", vo);
	}

	@Override
	public List<BookmarkVO> selectAll(BookmarkVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("BOOKMARK.BMSELECTALL",vo);
	}

	@Override
	public BookmarkVO selectOne(BookmarkVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("BOOKMARK.BMSELECTONE", vo);
	}

	@Override
	public void delete(BookmarkVO vo) {
		// TODO Auto-generated method stub
		mybatis.delete("BOOKMARK.BMDELETE", vo);
	}

	@Override
	public String check(BookmarkVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("BOOKMARK.BMCHECK",vo);
	}

	@Override
	public void deletelibrary(BookmarkVO vo) {
		// TODO Auto-generated method stub
		mybatis.delete("BOOKMARK.BMDELETELIBRARY", vo);
	}

}
