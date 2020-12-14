<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="scoreResult.jsp" id="frm">
이름:<input type="text" name="name"><br>
국어:<input type="text" name="kor" id="kor"><br>
영어:<input type="text" name="eng" id="eng"><br>
수학:<input type="text" name="math" id="math"><br>
<input onclick="check();" type="button" value="button 전송">
<button onclick="check();">성적조회</button>
</form>
<script>
function check(){
	var frm = document.querySelector("#frm");
	var kor = document.querySelector("#kor").value;
	var eng = document.querySelector("#eng").value;
	var math = document.querySelector("#math").value;
	if(kor==null||kor==""){
	alert("국어성적을 입력하세요");
	return;
	}
	if(eng==null||eng==""){
		alert("영어성적을 입력하세요");
		return;
	}
	if(math==null||math==""){
		alert("수학성적을 입력하세요");
		return;
	}
	frm.submit();
}
</script>
</body>
</html>