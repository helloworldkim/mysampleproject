package com.spring.reactboardserver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.reactboardserver.mapper.YoutubeMapper;
import com.spring.reactboardserver.vo.YoutubeVO;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600,allowCredentials = "true",
methods = {RequestMethod.DELETE,RequestMethod.GET,RequestMethod.POST,RequestMethod.PUT,RequestMethod.OPTIONS})
public class YoutubeController {
	
	@Autowired
	YoutubeMapper mapper;
	
	
	@GetMapping(value = "/youtube")
	public List<YoutubeVO> fetchMovies() {
		return mapper.fetchMovies();
	}
	@GetMapping(value = "/youtube/{id}")
	public YoutubeVO fetchMovieById(@PathVariable("id")long id) {
		System.out.println(id);
		return mapper.fetchMovieById(id);
	}
	@PostMapping(value="/youtube")
	public void addMovice(@RequestBody YoutubeVO item) {
		mapper.addMovice(item);
		System.out.println("즐겨찾기 데이터저장");
	}
	@DeleteMapping(value = "/youtube/{id}")
	public void removeMovie(@PathVariable("id")Long id) {
		mapper.removeMovie(id);
		System.out.println(id);
	}
}
