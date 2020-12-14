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
	AddressDAO addDAO = AddressDAO.getInstace();
	
	Address addr= addDAO.addrView(num);
	int count = addDAO.addrCount();
%>
<script>
function del(){
	if(confirm("정말삭제할까요?")){
		location.href="deletePro.jsp?num="+<%=num%>;
	}	
}
</script>
<div class="container">
<div align="right"><a href="insert.jsp">회원추가</a></div>
<h3>회원목록(<%=count%>)</h3>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=addr.getNum()%>">
<table class="table table-hover">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="<%=addr.getName() %>"></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" name="zipcode" value="<%=addr.getZipcode()%>">
			<button type="button">검색</button></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" value="<%=addr.getAddr()%>"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" value="<%=addr.getTel()%>"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="전체보기" onclick="location.href='list.jsp'">
				<input type="button" value="삭제" onclick="location.href='deletePro.jsp?num=<%=addr.getNum()%>'">
				<input type="button" value="javascript삭제" onclick="del()">
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>