package com.hello.bms.entity;


import java.sql.*;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
//@DynamicUpdate //변경사항이 있는경우에만 update를 실행시켜줌

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Accessors(chain = true)
public class Notice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "NOTICE_SEQ")
	@SequenceGenerator(initialValue = 1,sequenceName ="NOTICE_SEQ",name="NOTICE_SEQ",allocationSize = 1)
	private long id;
	
	private String title;
	private String content;
	private String noticeYn;
	
	@CreationTimestamp
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime createdAt;
	//private Date createdAt;
	
	@Column(updatable = false)
	private String createdBy;
	
	@UpdateTimestamp
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime ModifiedAt;
	//private Date ModifiedAt;
	
	private String ModifiedBy;

	

}
