<%@page import="org.membe.dao.MemberDAO"%>
<%@page import="org.membe.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mDTO" class="org.member.dto.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mDTO"/>
<%
	MemberDAO dao = MemberDAOImpl.getInstance();
	dao.memInsert(mDTO);
%>
<script>
alert("가입성공")
location.href="loginForm.jsp"
</script>