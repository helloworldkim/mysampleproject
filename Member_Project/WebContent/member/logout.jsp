<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("로그아웃되었습니다");
//location.href="loginForm.jsp";
</script>
<%
	session.invalidate();
	response.sendRedirect("loginForm.jsp");
%>

</body>
</html>