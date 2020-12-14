<%@page import="java.io.PrintWriter"%>
<%@page import="org.membe.dao.MemberDAOImpl"%>
<%@page import="org.membe.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userid = (String)session.getAttribute("userid");
	if(userid==null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하셔야 코멘트 작성이 가능합니다')");
		script.println("location.href='loginForm.jsp'");
		script.println("</script>");
	}
	
	MemberDAO dao = MemberDAOImpl.getInstance();
	dao.memDelete(userid);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('탈퇴되었습니다')");
	script.println("location.href='loginForm.jsp'");
	script.println("</script>");
	//response.sendRedirect("loginForm.jsp");
%>