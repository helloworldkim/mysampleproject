package com.javalec.spring_mvc_board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_mvc_board.command.BCommand;
import com.javalec.spring_mvc_board.command.BContentCommand;
import com.javalec.spring_mvc_board.command.BDeleteCommand;
import com.javalec.spring_mvc_board.command.BModifyCommand;
import com.javalec.spring_mvc_board.command.BReplyCommand;
import com.javalec.spring_mvc_board.command.BReplyViewCommand;
import com.javalec.spring_mvc_board.command.BWriteCommand;
import com.javalec.spring_mvc_board.dto.BDto;
import com.javalec.spring_mvc_board.util.Constant;

@Controller
public class BController {

	BCommand command;
	
	@Autowired
	private SqlSession sqlSession;
	
	public JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	@RequestMapping("/list")
	public String list(Model model) {
		System.out.println("list()");

		sqlSession.getConnection();
		List<BDto> dtos = sqlSession.selectList("listDao");
		model.addAttribute("list",dtos);
		
		return "list";
	}
	
	//작성하는 폼으로보냄
	@RequestMapping("/write_view")
	public String write_view(Model model) {
		System.out.println("wrtie_view()");
		
		return "write_view";
	}
	
	//글 작성하는부분
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		model.addAttribute("request",request);
		command = new BWriteCommand();
		command.execute(model);
		
		//글 작성 후 list 페이지로 보냄
		return "redirect:list";
	}
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request,Model model) {
		System.out.println("content_view()");
		
		model.addAttribute("request",request);
		command = new BContentCommand();
		command.execute(model);
		
		return "content_view";
		
	}
	//포스트방식으로 올때 반응
	@RequestMapping(method = RequestMethod.POST,value = "/modify")
	public String modify(HttpServletRequest request,Model model) {
		System.out.println("modift()");
		model.addAttribute("request",request);
		command = new BModifyCommand();
		command.execute(model);

		return "redirect:list";
	}
	
	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest request,Model model) {
		System.out.println("reply_view()");
		model.addAttribute("request",request);
		command = new BReplyViewCommand();
		command.execute(model);
		
		return "reply_view";
	}
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request,Model model) {
		System.out.println("reply()");
		model.addAttribute("request",request);
		command = new BReplyCommand();
		command.execute(model);
		
		return"redirect:list";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		model.addAttribute("request",request);
		command = new BDeleteCommand();
		command.execute(model);
		
		return"redirect:list";
		
	}

}
