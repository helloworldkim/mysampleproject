<%@page import="java.util.ArrayList"%>
<%@page import="com.member.dao.MemberDAOImpl"%>
<%@page import="com.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDAOImpl memberDAO = MemberDAOImpl.getInstace();
	ArrayList<MemberDTO> memberList = memberDAO.memberList(); //전체회원 리스트에 받음
%>
<script>
function del(userid){
	//alert(userid);
	location.href="memberDeletePro.jsp?userid="+userid;
}
</script>
<div class="container">
<nav class="pull-right">
	<a href="memberForm.jsp">회원가입</a>
</nav>
<table class="table table-hover">
	<thead>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<% for(int i=0; i<memberList.size(); i++){%>
		<tr>
			<td><%=memberList.get(i).getName()%></td>
			<td><a href='memberDetail.jsp?userid=<%=memberList.get(i).getUserid()%>'><%=memberList.get(i).getUserid()%></a></td>
			<td><%=memberList.get(i).getEmail()%></td>
			<td><%=memberList.get(i).getPhone()%></td>
			<td onclick="del('<%=memberList.get(i).getUserid()%>')">삭제</td>
		</tr>
	<%} %>
	</tbody>
</table>
</div>

</body>
</html>