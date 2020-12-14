<%@page import="com.member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<title>Document</title>
	<%
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		MemberDAOImpl memberDAO = MemberDAOImpl.getInstace();
		
		MemberDTO member = memberDAO.findById(userid);
		
	%>
</head>
<body>
<div class="container">
<h1>회원정보</h1>
<form>
	<table class="table table-hover">
		<tr>
			<td>이름</td>
			<td><input type="text" value="<%=member.getName()%>"></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" readonly="readonly" value="<%=member.getUserid()%>"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" value="<%=member.getPhone()%>"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" value="<%=member.getEmail()%>"></td>
		</tr>
	</table>
	<input type="button" id="btn" value="수정">
	<input type="reset" value="취소">
</form>
</div>
</body>
</html>
