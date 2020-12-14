package com.hello.bms.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hello.bms.entity.Member;
import com.hello.bms.repository.MemberRepository;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	MemberRepository memberRepository;
	
	@GetMapping(value = "/join")
	public String join() {
		System.out.println("JOIN PAGE");
		return "join";
	}
	

	
	@PostMapping(value = "/join")
	public String join(HttpServletRequest request,
			@ModelAttribute Member member) {
		System.out.println(member);
		member.setCreatedBy("SYSTEM").setCreatedAt(LocalDateTime.now());
		/* 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String pw = passwordEncoder.encode(member.getPassword());
		member.setPassword(pw);
		*/
		Member newMember = memberRepository.save(member);
		if (newMember != null) {
			return "redirect:"+request.getContextPath()+"/member/login";
		} else {
			return "redirect:"+request.getContextPath()+"/error";
		}
		
		
	}
	@GetMapping(value = "/login")
	public String login() {
		System.out.println("login PAGE");
		return "login";
	}
	
	@PostMapping(value = "/login")
	public String login(HttpServletRequest request,HttpSession httpSession,
			@ModelAttribute Member member) {
		Member loginMember = memberRepository.findByUseridAndUserpw(member.getUserid(), member.getUserpw());
		
		if(loginMember!=null) {
			httpSession.setAttribute("USERID_SESSION",loginMember.getUserid());
			return "redirect:"+request.getContextPath()+"/home";	
		}else {
			return "redirect:"+request.getContextPath()+"/member/login";
		}
		
	}
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request,HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:"+request.getContextPath()+"/home";
	}
	
}
