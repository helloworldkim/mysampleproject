<%@page import="java.util.ArrayList"%>
<%@page import="com.address.ZipCodeDTO"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="zipCheck.js"></script>
</head>
<body>
<form id="frm" action="zipCheck.jsp">
	<table>
		<tr>
			<td>동이름입력:<input type="text" name="dong" id="dong">
			<input type="button" value="검색" id="send">
			</td>
		</tr>
	</table>
</form>
<div>
	<table id="area">
	</table>
</div>

</body>
</html>