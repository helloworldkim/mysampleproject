<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>전송 form</legend>
<form action="formResult.jsp" method="get">
이름 :<input type="text" name="userName"><br>
나이 :<input type="text" name="userAge"><br>
성별:
남자<input type="radio" name="gender" value="남자" checked> 여자 <input type="radio"name="gender" value="여자"><br>
관심분야:
운동<input type="checkbox" name="hobby" value="운동">
게임<input type="checkbox" name="hobby" value="게임">
등산<input type="checkbox" name="hobby" value="등산" >
영화<input type="checkbox" name="hobby" value="영화"><br>
직업:<select name="job">
<option value="학생">학생</option>
<option value="공무원">공무원</option>
<option value="회사원">회사원</option>
<option value="기타">기타</option>
</select><br>
<input type="submit" value="전송">
</form>
</fieldset>
</body>
</html>