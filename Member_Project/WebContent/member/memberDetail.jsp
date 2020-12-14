<%@page import="org.membe.dao.MemberDAO"%>
<%@page import="org.member.dto.MemberDTO"%>
<%@page import="org.membe.dao.MemberDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="../css/bootstrap.css">
	<script src="memberDetail.js"></script>
	<title>Document</title>
	<%
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		
		MemberDTO member = memberDAO.findById(userid);
		
	%>
</head>
<body>
<div class="container">
<h1>회원정보</h1>
<form id='frm' >
	<table class="table table-hover">
		<tr>
			<td>이름</td>
			<td><input type="text" value="<%=member.getName()%>" name='name' id="name"></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" readonly="readonly" name="userid" id="userid" value="<%=member.getUserid()%>"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name='phone' id='phone' value="<%=member.getPhone()%>"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" name='email' id='email' value="<%=member.getEmail()%>"></td>
		</tr>
	</table>
	<input type="button" id="btn" value="수정">
	<input type="reset" value="취소">
</form>
</div>
<script></script>
</body>
</html>
