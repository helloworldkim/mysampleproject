package com.hello.bms.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	
	private long id;
	private String title;
	private String content;
	private long hit;
	private byte[] img;
	//private LocalDateTime createdAt;
	private String createdAt; 	//db에 테이블명 created_at 카멜케이스 취소!
	private String createdBy;	//db에 테이블명 created_by
	
	/*
	private long brd_id;
	private String brd_title;
	private String brd_content;
	private long hit;
	private byte[] img;
	private LocalDateTime reg_date;
	private String reg_userid;
	*/
}
