package com.hello.bms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hello.bms.entity.Notice;
import com.hello.bms.repository.NoticeRepository;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	
	@Autowired
	NoticeRepository noticeRepository;
	
	@GetMapping(value = "/list")
	public String noticeHome(HttpServletRequest request,HttpSession httpSession,Model model) {
		List<Notice> item =noticeRepository.findAllByOrderByNoticeYnDesc();
		
		model.addAttribute("list",item);
		return "/notice/notice_list";
	}
	
	@GetMapping(value = "/write")
	public String noticeWrite() {
		
		return "/notice/notice_write";
	}
	@PostMapping(value = "/write")
	public String noticeWrite(HttpServletRequest request,HttpSession httpSession,
			Model model,
			@ModelAttribute Notice item) {
		System.out.println("WRITE페이지!");
		System.out.println(item.toString());
		noticeRepository.save(item);
		return "redirect:"+request.getContextPath()+"/notice/list";
	}
	@GetMapping(value = "/content")
	public String noticeContent(HttpServletRequest request,HttpSession httpSession,Model model,
			@RequestParam("id") long id) {
			Notice item = noticeRepository.findById(id);
			model.addAttribute("item",item);	
		return "/notice/notice_content";
	}
	@PostMapping(value = "/update")
	@Transactional
	public String noticeUpdate(HttpServletRequest request,HttpSession httpSession,
			Model model,
			@ModelAttribute Notice item) {
		System.out.println("UPDATE 페이지!");
		System.out.println(item.toString());
		noticeRepository.save(item);
		return "redirect:"+request.getContextPath()+"/notice/list";
	}
	
	@GetMapping(value = "/delete")
	public String noticeDelete(HttpServletRequest request,HttpSession httpSession,Model model,
			@RequestParam("id")long id) {
		noticeRepository.deleteById(id);
		return "redirect:"+request.getContextPath()+"/notice/list";
		
	}
}
