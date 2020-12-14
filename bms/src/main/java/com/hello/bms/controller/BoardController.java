package com.hello.bms.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hello.bms.entity.Board;
import com.hello.bms.mapper.BoardMapper;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	BoardMapper boardMapper;
	
	//트랜젝션 관리 할때 사용
	@Autowired
	EntityManagerFactory emf;
	
	@GetMapping(value = "/list")
	public String list(HttpServletRequest request,HttpSession httpSession,Model model) {
		List<Board> list = boardMapper.getList();
		
		model.addAttribute("list",list);
		return "/board/board_list";
	}
	@GetMapping(value = "/write")
	public String write() {
		
		return "/board/board_write";
	}
	
	@PostMapping(value = "/write")
	public String write(HttpServletRequest request,HttpSession httpSession,
			@ModelAttribute Board item,
			@RequestParam("img") MultipartFile[] imgs) throws IOException {
		//이미지 첨부여부 확인 
		if(imgs != null && imgs.length>0) {
			for(MultipartFile tmp:imgs) {
				try {
					item.setImg(tmp.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
					e.getMessage();
				}
			}
		}
		System.out.println(item.toString());
		boardMapper.setBoard(item);
		
		return "redirect:"+request.getContextPath()+"/board/list";
	}
	
	@GetMapping(value = "/content")
	public String content(HttpServletRequest request,HttpSession httpSession,Model model,
			@RequestParam(value = "id",defaultValue = "0") long id) {
		if (id==0) {
			return "redirect:"+request.getContextPath()+"/board/list";
		} else {
			boardMapper.updateBoardHit(id);
			Board item = boardMapper.getBoard(id);
			model.addAttribute("item",item);
			return "/board/board_content";
		}
		
		
		
	}
	
	@PostMapping(value = "/update")
	public String update(HttpServletRequest request, HttpSession httpSession,Model model,
			@ModelAttribute Board item) throws IOException {
		System.out.println("update post입니다");
		System.out.println(item.toString());
		
		boardMapper.setUpdateBoard(item);
		
		return "redirect:"+request.getContextPath()+"/board/list";
	}
	
	@GetMapping(value = "/delete")
	public String delete(HttpServletRequest request,HttpSession httpSession,Model model,
			@RequestParam(value = "id",defaultValue = "0") long id) {
		Integer ret = boardMapper.delBoard(id);
		System.out.println(ret);
		if (ret==1) {
			return "redirect:"+request.getContextPath()+"/board/list";
		} else {
			return null;
		}

		
	}
}
