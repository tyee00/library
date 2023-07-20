package com.library.k1.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	
	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.insertMember(vo);
		
	}

	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.selectAll(vo);
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.updateMember(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.deleteMember(vo);
	}

	@Override
	public String idchkMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.idchkMember(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

}
