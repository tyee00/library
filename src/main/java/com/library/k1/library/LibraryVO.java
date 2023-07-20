package com.library.k1.library;

import lombok.Data;

@Data
public class LibraryVO {
	private int idx;
	private String libraryName; //도서관명
	private String libraryAddr1; //도서관주소
	private String libraryAddr2;
	private String zipcode; //우편번호
	
	private String libraryTel; //도서관 전화번호
	private String libraryHomepage; //도서관 홈페이지 주소
	
	private String ch1; //검색을 위한 필드
	private String ch2;
}
