package com.library.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.k1.bookmark.BookmarkService;
import com.library.k1.bookmark.BookmarkVO;
import com.library.k1.library.LibraryService;
import com.library.k1.library.LibraryVO;
import com.library.k1.member.MemberService;
import com.library.k1.member.MemberVO;





@Controller
public class LibraryController {
	
	@Autowired
	LibraryService service;
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	BookmarkService bservice;
	
	
	@RequestMapping("/library_selectAll.do")
	String selectAll(Model model, LibraryVO vo) {
		List<LibraryVO> li = service.selectAll(vo);
		model.addAttribute("li",li);
		return "/library/library_selectAll.jsp";
	}
	@RequestMapping("/library_selectOne.do")
	String selectOne(Model model, LibraryVO vo) {
		LibraryVO m = service.selectOne(vo);
		model.addAttribute("m",m);
		return "/library/library_edit.jsp";
	}
	
	@RequestMapping("/library_insertLibrary.do")
	String insertLibrary(LibraryVO vo) {
		service.insertLibrary(vo);
		return "/library_selectAll.do";
	}
	
	@RequestMapping("/library_updateLibrary.do")
	String updateLibrary(LibraryVO vo) {
		service.updateLibrary(vo);
		return "/library_selectAll.do";
	}
	@RequestMapping("/library_deleteLibrary.do")
	String deleteLibrary(LibraryVO vo, BookmarkVO bvo) {
		service.deleteLibrary(vo);
		bvo.setL_idx(vo.getIdx());
		bservice.deletelibrary(bvo);
		return "/library_selectAll.do";
	}
	@RequestMapping("/library_selectMap.do")
	String selectMap(Model model, MemberVO mvo, LibraryVO vo, HttpServletRequest request) {
		LibraryVO m = service.selectOne(vo);
		model.addAttribute("m",m);
		HttpSession session = request.getSession();
		int idx = (int) session.getAttribute("idx");

		mvo.setIdx(idx);
		model.addAttribute("member", mservice.selectOne(mvo));
		return "/library/library_selectMap.jsp";
	}
}
