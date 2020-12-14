<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#btnSearch").click(function(){
		$.getJSON("searchAction.amy",
				{"field" : $("#field").val(), "word" :$("#word").val()},
				 function(data){
					fsuccess(data);
				}
		) ;//getJSON
	}) //btnSearch
	 
	fsuccess = function(data){
		 $("#count").html("총 게시물 수 : "+data.count);
	 	 var htmlStr ="";
		 $.each( data.arr, function( key, val ) {
	  		  htmlStr +="<tr>";
	  		  htmlStr +="<td>순서</td>";
	  	      htmlStr +="<td>"+val.num+"</td>";
		      htmlStr +="<td>"+val.name+"</td>";
		      htmlStr +="<td>"+val.addr+"</td>";
		      htmlStr +="<td>"+val.tel+"</td>";
		      htmlStr +="<td onclick='fdelete("+val.num+")'>삭제</td>";
		      htmlStr +="</tr>";
	   }); 
		$("table tbody").html(htmlStr);
	}
	 
}); //document

function fdelete(num){
	$.getJSON("deleteAjaxAction.amy?num="+num, 
			function(data){
					fsuccess(data);
	   }
   );
}


</script>

</head>
<body>
<a href="insertAction.amy">글쓰기</a>

<div align="center" id="count">총 게시물 수 : ${count }</div>
<div id ="area">
<table>
<thead>
<tr>
	<th>순서</th>
	<th>번호 </th>
	<th>이름 </th>
	<th>주소 </th>
	<th>전화번호 </th>
	<th>삭제 </th>
</tr>
</thead>
<tbody>	
<c:forEach items="${arr}" var="dto" varStatus="st">
		<tr>
		<td>${count -st.index} </td>
		<td>${dto.num } </td>
		<td><a href="viewAction.amy?num=${dto.num}">${dto.name }</a> </td>
		<td>${dto.addr } </td>
		<td>${dto.tel }  </td>
		<td onclick="fdelete(${dto.num } )">삭제  </td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
<br><br><br><br><br><br>

<div align="center">
 <form name="search"  id="search">
<select name="field" id="field">
	<option value="name">이름</option>
	<option value="tel">전화번호</option>
</select>
<input type="text" name="word" id="word">
<input type="button" value="찾기"  id="btnSearch">
</form>
</div>

</body>
</html>







