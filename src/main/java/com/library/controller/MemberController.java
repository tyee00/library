package com.library.controller;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.k1.member.MemberVO;
import com.library.k1.member.MemberService;

@Controller
public class MemberController {
	
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/member_selectAll.do")
	String selectAll(Model model, MemberVO vo) {
		List<MemberVO> li = service.selectAll(vo);
		
		model.addAttribute("li",li);
		return "/member/member_selectAll.jsp";
	}
	@RequestMapping("/member_selectOne.do")
	String selectOne(Model model, MemberVO vo) {
		MemberVO m = service.selectOne(vo);
		model.addAttribute("m",m);
		return "/member/member_edit.jsp";
	}
	
	@RequestMapping("/member_insertMember.do")
	String insertMember(MemberVO vo) {
		service.insertMember(vo);
		return "/index.jsp";
	}
	
	@RequestMapping("/member_updateMember.do")
	String updateMember(MemberVO vo) {
		service.updateMember(vo);
		return "/member_selectAll.do";
	}
	@RequestMapping("/member_deleteMember.do")
	String deleteMember(MemberVO vo) {
		service.deleteMember(vo);
		return "/member_selectAll.do";
	}
	
	@RequestMapping("/idChk.do")
	void idChk(HttpServletResponse response ,MemberVO vo) throws Exception {
		PrintWriter out=response.getWriter();
		System.out.println(vo);
		String id = service.idchkMember(vo);
		if( id == null) {
			if(vo.getId() != "") {
				out.print("T");
			}
			
		} else {
			out.print("F");
		}

	}
	
	@RequestMapping("/login.do")
	String login(MemberVO vo , HttpServletRequest request) throws Exception {

		MemberVO m =  service.login(vo);

		if( m == null) {
			return "/login/login.jsp";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("id", m.getId());
			session.setAttribute("idx", m.getIdx());
			return "/index.jsp"; 	
		}
		
		
	}
	@RequestMapping("/logout.do")
	String logout( HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "/index.jsp"; 	
			
		
	}
	
	
}
