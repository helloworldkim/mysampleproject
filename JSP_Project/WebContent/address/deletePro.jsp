<%@page import="java.io.PrintWriter"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
	AddressDAO addrDAO = AddressDAO.getInstace();
	addrDAO.addrDelete(num);
%>
<script>
alert("삭제성공")
location.href='list.jsp';
</script>

</body>
</html>