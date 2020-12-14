<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="com.member.dto.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	
	MemberDAOImpl memDAO = MemberDAOImpl.getInstace();
	memDAO.memberInsert(member);

%>

<script>
alert("가입성공");
location.href='memberForm.jsp';
</script>