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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="list.js"></script>
<%
	request.setCharacterEncoding("utf-8");
	String field="";
	String word="";
	if(request.getParameter("word")!=null){
		word = request.getParameter("word");
		field= request.getParameter("field");
	}
	JAddressDAO addDAO = JAddressDAO.getInstace();
	ArrayList<AddressVO> addList = addDAO.addrList();
	//ArrayList<AddressVO> addList = addDAO.addrList(field,word);
	int count = addDAO.addrCount();
	//int count = addDAO.addrCount(field,word);
%>
<script>
function searchCheck(){
	var word = document.querySelector("#word").value;
	var field = document.querySelector("#field").value;
	
	if(word==null||word==""){
		alert("검색어를 입력해주세요");
		return;
	}
	frm.submit();//list.jsp
	
}
</script>
</head>
<body>
<%
	
%>
<div align="right"><a href="insert.jsp">회원추가</a></div>
<h3>회원목록(<span id="cntSpan"><%=count%></span>)</h3>
<table class="table table-hover">
	<thead class="thead-dark">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>전화번호</th>
			<td>삭제</td>
		</tr>
	</thead>
	<tbody id="target">
<%for(int i=0; i<addList.size(); i++){%>
		<tr>
			<td><%=addList.get(i).getNum() %></td>
			<td><a href="detail.jsp?num=<%=addList.get(i).getNum()%>"><%=addList.get(i).getName() %></a></td>
			<td><%=addList.get(i).getAddr()%></td>
			<td><%=addList.get(i).getTel()%></td>
			<td><input type="button" class="delBtn" value="삭제" data-num=<%=addList.get(i).getNum() %>></td>
		</tr>
<% }%>
	</tbody>
	</table>
	<select name="field" id="field">
		<option value="name">이름</option>
		<option value="tel">전화번호</option>
	</select>
	<input type="text" name="word" id="word">
	<input type="button" value="검색" id="btnSearch">
	

</body>
</html>