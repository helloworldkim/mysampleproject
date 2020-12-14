<%@page import="org.membe.dao.MemberDAOImpl"%>
<%@page import="org.membe.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	
	MemberDAO dao = MemberDAOImpl.getInstance();
	int result = dao.idCheck(userid);
	out.println(result);
%>