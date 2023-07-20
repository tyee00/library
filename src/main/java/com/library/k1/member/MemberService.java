package com.library.k1.member;

import java.util.List;

public interface MemberService {
	void insertMember(MemberVO vo);
	List<MemberVO> selectAll(MemberVO vo);
	MemberVO selectOne(MemberVO vo);
	void updateMember(MemberVO vo);
	void deleteMember(MemberVO vo);
	String idchkMember(MemberVO vo);
	MemberVO login(MemberVO vo);
}
