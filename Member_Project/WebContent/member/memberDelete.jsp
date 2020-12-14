<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.membe.dao.MemberDAO"%>
<%@page import="org.membe.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String userid = request.getParameter("userid");
	
	MemberDAO dao = MemberDAOImpl.getInstance();
	dao.memDelete(userid); //삭제완료
	ArrayList<MemberDTO> arr = dao.memList();
	int count = dao.getCount();
	JSONArray jarr = new JSONArray();
	for(MemberDTO a : arr){
		//JSON Object 생성
		JSONObject obj = new JSONObject();
		String mode = a.getAdmin()==0?"일반회원":"관리자";
		obj.put("name", a.getName());
		obj.put("userid", a.getUserid());
		obj.put("email", a.getEmail());
		obj.put("phone", a.getPhone());
		obj.put("pwd", a.getPwd());
		obj.put("admin", mode);
		jarr.add(obj);
	}
	JSONObject countObj = new JSONObject();
	countObj.put("count",count);
	
	JSONObject mainObject = new JSONObject();
	mainObject.put("array",jarr);
	mainObject.put("count",countObj);
	
	out.println(mainObject.toJSONString());
	
	
	
%>