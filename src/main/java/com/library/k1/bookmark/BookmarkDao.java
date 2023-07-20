package com.library.k1.bookmark;

import java.util.List;

public interface BookmarkDao {
	void insert(BookmarkVO vo);
	List<BookmarkVO> selectAll(BookmarkVO vo);
	BookmarkVO selectOne(BookmarkVO vo);
	void delete(BookmarkVO vo);
	void deletelibrary(BookmarkVO vo);
	String check(BookmarkVO vo);
	

}
