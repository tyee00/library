package com.library.k1.bookmark;

import lombok.Data;

@Data
public class BookmarkVO {
	private int idx;
	private int l_idx;
	private String libraryName;
	private int m_idx;
	private String id;
	
	private String libraryAddr1; //도서관주소
	private String libraryAddr2;
	private String zipcode; //우편번호
	
	private String libraryTel; //도서관 전화번호
	private String libraryHomepage; //도서관 홈페이지 주소

	private String addr1; //회원 주소1
	private String addr2;
}
