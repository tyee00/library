package com.library.k1.library;

import java.util.List;

public interface LibraryService {
	void insertLibrary(LibraryVO vo);
	List<LibraryVO> selectAll(LibraryVO vo);
	LibraryVO selectOne(LibraryVO vo);
	void updateLibrary(LibraryVO vo);
	void deleteLibrary(LibraryVO vo);
}
