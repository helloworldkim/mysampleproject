package com.spring.reactboardserver.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.reactboardserver.vo.UserVO;

@Mapper
//@MapperScan(basePackages = {"com.spring.reactboardserver.mapper"})
public interface UserMapper {

	public List<UserVO> fetchUsers();
	
	public void addUser(UserVO user);
	
	public void deleteUser(Long id);
	
	public UserVO fetchUserById(Long id);
	
	public void editUser(UserVO user);
}
