<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid="";
	if(request.getParameter("userid")!=null){
		userid = request.getParameter("userid");
	}
	MemberDAOImpl memberDAO= MemberDAOImpl.getInstace();
	response.getWriter().write(Integer.toString(memberDAO.userIdCheck(userid))); //String타입으로 숫자를 보내줌

%>