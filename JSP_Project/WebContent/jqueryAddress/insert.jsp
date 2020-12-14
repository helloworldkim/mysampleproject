<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript">
function insertCheck(){
	var name = document.querySelector("#name").value;
	var zipcode = document.querySelector("#zipcode").value;
	var addr = document.querySelector("#addr").value;
	var tel = document.querySelector("#tel").value;
	var frm = document.querySelector("#frm");

	if(name==null||name==""){
		alert("이름을 입력해주세요");
	}
	else if((zipcode==null ||zipcode=="")&&(addr==null||addr=="")){
		alert("주소를 검색해주세요");
	}else if(tel==null || tel==""){
		alert("전화번호를 입력해주세요");
	}else{
		frm.submit();
	}
}

var finder = document.querySelector("#zip");
function zipfinder(){
	window.open("zipCheck.jsp","_blank","width=700 height=400")
}
</script>
</head>
<body>
<div class="container">
<div align="right"><a href="list.jsp">전체보기</a></div><br>
<form action="insertPro.jsp" method="post" name="frm" id="frm" onsubmit="return false">
<table class="table table-hover">
<thead>
	<tr>
		<th>주소록 등록하기</th>
	</tr>
</thead>
<tbody>
<tr>
	<td>이름:</td>
	<td><input type="text" id="name" name="name"></td>
</tr>
<tr>
	<td>우편번호:</td>
	<td><input type="text" id="zipcode" name="zipcode"><input id="zip" type="button" onclick="zipfinder()" value="검색"></td>
</tr>
<tr>
	<td>주소:</td>
	<td><input type="text" id="addr" name="addr"></td>
</tr>
<tr>
	<td>전화번호:</td>
	<td><input type="text" id="tel" name="tel"></td>
</tr>
</tbody>
</table>
<input type="submit" value="등록" onclick="insertCheck()">
<input type="reset" value="취소">
</form>
</div>


</body>
</html>