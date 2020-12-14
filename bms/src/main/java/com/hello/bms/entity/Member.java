package com.hello.bms.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Accessors(chain = true)
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator ="MEMBER_SEQ" )
	@SequenceGenerator(initialValue = 1,sequenceName ="MEMBER_SEQ",name="MEMBER_SEQ",allocationSize = 1)
	private long id; //기본생성자
	private String userid; //아이디
	private String userpw; //비밀번호
	private String username; //이름
	private String userphone; //휴대폰
	private LocalDateTime createdAt; //created_at(스네이크케이스)를 자동으로 변환해줌
	private String createdBy; //작성자
	
}
