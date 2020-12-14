<%@page import="com.exam.DataBean"%>
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
DataBean dbean = new DataBean();

%>
<%=dbean.getToday() %>
</body>
</html>