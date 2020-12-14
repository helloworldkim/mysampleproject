<%@page import="org.membe.dao.MemberDAO"%>
<%@page import="org.member.dto.MemberDTO"%>
<%@page import="org.membe.dao.MemberDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mDTO" class="org.member.dto.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mDTO"/>
<%
	MemberDAO memberDAO = MemberDAOImpl.getInstance();
	int result = memberDAO.memUpdate(mDTO);
	
	/* if(result==1){
		//session.removeAttribute("userid"); 세션하나만 삭제
		session.invalidate(); //모든세션 삭제
		response.sendRedirect("loginForm.jsp");
	} */
	out.println(result);
%>
