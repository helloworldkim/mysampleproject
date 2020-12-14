package org.membe.dao;

import java.util.ArrayList;

import org.member.dto.MemberDTO;

public interface MemberDAO {
	//추가
	public void memInsert(MemberDTO member);
	//전체보기
	public ArrayList<MemberDTO> memList();
	//수정
	public int memUpdate(MemberDTO member);
	//삭제
	public void memDelete(String userid);
	//상세보기
	public MemberDTO findById(String userid);
	//아이디 중복체크
	public int idCheck(String userid);
	
	public int loginCheck(String userid,String pwd);
	
	public int getCount();
}
