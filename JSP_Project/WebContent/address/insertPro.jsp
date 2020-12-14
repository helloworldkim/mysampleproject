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
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ad" class="com.address.Address" ></jsp:useBean>
<jsp:setProperty property="*" name="ad"/>

<% 
	AddressDAO addDAO = AddressDAO.getInstace();
	addDAO.addrInsert(ad);
	response.sendRedirect("list.jsp");
	
%>
</body>
</html>