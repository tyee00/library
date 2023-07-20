package com.library.k1.member;

import lombok.Data;

@Data
public class MemberVO {
	private int idx;
	private String id;
	private String password;
	private String name;
	private String addr1; //회원 주소1
	private String addr2;
	private String zipcode; //우편번호
	private String etc;
}
