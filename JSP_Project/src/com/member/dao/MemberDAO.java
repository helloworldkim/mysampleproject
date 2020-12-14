package com.member.dao;

import java.util.ArrayList;

import com.member.dto.MemberDTO;

public interface MemberDAO {
	//추가
	public void memberInsert(MemberDTO member);
	
	//전체보기
	public ArrayList<MemberDTO> memberList();
	
	//수정
	public int memberUpdate(MemberDTO member);
	
	//상세보기
	public MemberDTO findById(String userid);
	
	//삭제
	public void memberDelete(String userid);

}
