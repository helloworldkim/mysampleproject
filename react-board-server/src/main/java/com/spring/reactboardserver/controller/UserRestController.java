package com.spring.reactboardserver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.reactboardserver.mapper.UserMapper;
import com.spring.reactboardserver.vo.UserVO;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600,allowCredentials = "true",
methods = {RequestMethod.DELETE,RequestMethod.GET,RequestMethod.POST,RequestMethod.PUT,RequestMethod.OPTIONS})
public class UserRestController {

	@Autowired
	UserMapper mapper;
		
	@GetMapping(value = "/users")
	public List<UserVO> fetchUsers() {
		return mapper.fetchUsers();
	}
	@GetMapping(value = "/users/{id}")
	public UserVO fetchUserById(@PathVariable("id")long id) {
		System.out.println(id);
		return mapper.fetchUserById(id);
	}
	@PostMapping(value="/users")
	public void addUser(@RequestBody UserVO user) {
		mapper.addUser(user);
		System.out.println(user);
	}
	@PutMapping(value = "/users/{id}")
	public void editUser(@RequestBody UserVO user, @PathVariable("id") String id) {
		System.out.println(user);
		System.out.println(id);
		user.setId((long) Integer.parseInt(id));
		mapper.editUser(user);
	}
	
	@DeleteMapping(value = "/users/{id}")
	public void deleteUser(@PathVariable("id")Long id) {
		mapper.deleteUser(id);
		System.out.println(id);
	}
}
