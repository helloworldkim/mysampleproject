<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@page import="com.address.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	JAddressDAO dao = JAddressDAO.getInstace();

	AddressVO aVO= dao.addressDetail(num);

%>
<div class="container">
<div align="right"><a href="insert.jsp">회원추가</a></div>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=aVO.getNum()%>">
<table class="table table-hover">
	<thead>
	<tr>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
	</tr>
	</thead>
		<tr>
			<td><input type="text" name="name" value="<%=aVO.getName() %>"></td>
			<td><input type="text" name="addr" value="<%=aVO.getAddr()%>"></td>
			<td><input type="text" name="tel" value="<%=aVO.getTel()%>"></td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>