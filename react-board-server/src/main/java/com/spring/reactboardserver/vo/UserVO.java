package com.spring.reactboardserver.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class UserVO {

	private Long id;
	private String userId;
	private String password;
	private String phone;
	private String email;
	private LocalDateTime registeredDate;
	private String del;
}
