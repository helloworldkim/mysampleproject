<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="fb" class="com.exam.FormBean"></jsp:useBean>
    <jsp:setProperty property="*" name="fb"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a</title>
</head>
<body>
<%=fb.getName() %>
<%=fb.getAge() %>
<%=fb.getGender() %>
<%
String h[]= fb.getHobby();
String temp="";
for(int i=0; i<h.length; i++){
	temp+=h[i]+" ";
}%>
<%=temp %>
</body>
</html>