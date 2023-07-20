package com.library.k1.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		mybatis.insert("MEMBER.MINSERT", vo);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("MEMBER.MSELECTALL", vo);
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		System.out.println(vo);
		// TODO Auto-generated method stub
		return mybatis.selectOne("MEMBER.MSELECTONE", vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		mybatis.update("MEMBER.MUPDATE", vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		// TODO Auto-generated method stub
		mybatis.delete("MEMBER.MDELETE", vo);
	}

	@Override
	public String idchkMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MEMBER.MIDCHK", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MEMBER.MLOGIN", vo);
	}

}
