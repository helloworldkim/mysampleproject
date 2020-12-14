<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid="";
	if(request.getParameter("userid")!=null){
		userid = request.getParameter("userid");
	}
	MemberDAOImpl memDAO = MemberDAOImpl.getInstace();
	memDAO.memberDelete(userid);

%>
<script>
alert("삭제성공");
location.href="memberList.jsp"
</script>
