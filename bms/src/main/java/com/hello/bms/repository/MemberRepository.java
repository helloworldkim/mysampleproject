package com.hello.bms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hello.bms.entity.Member;

import lombok.experimental.Accessors;

@Repository
@Accessors(chain = true)
public interface MemberRepository extends JpaRepository<Member, Long>{

	Member findByUseridAndUserpw(String id,String userpw);

	Member findByUserid(String userid);
}
