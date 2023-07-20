package com.library.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.k1.bookmark.BookmarkService;
import com.library.k1.bookmark.BookmarkVO;

@Controller
public class BookmarkController {

	@Autowired
	BookmarkService service;
	
	@RequestMapping("/bookmark_Insert.do")
	String bookmarkInsert(BookmarkVO vo) {
		String id = service.check(vo);
		System.out.println(id);
		if (id == null) {
			service.insert(vo);
		} else {
			
		}
		
		return "/library_selectAll.do";
	}
	
	@RequestMapping("/bookmark_selectAll.do")
	String bookmarkSelectAll(Model model,BookmarkVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setM_idx((int)session.getAttribute("idx"));
		model.addAttribute("li", service.selectAll(vo));
		return "/bookmark/bookmark_selectAll.jsp";
	}
	@RequestMapping("/bookmark_delete.do")
	String bookmarkDelete(BookmarkVO vo) {
		
		service.delete(vo);
		return "/bookmark_selectAll.do";
	}
}

