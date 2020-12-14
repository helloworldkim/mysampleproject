package com.hello.bms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hello.bms.entity.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long>{
	
	Notice findById(long id);
	
	List<Notice> findAllByOrderByNoticeYnDesc();

	
}
