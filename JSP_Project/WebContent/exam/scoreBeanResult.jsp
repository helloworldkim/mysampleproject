<%@page import="com.exam.ScoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
String name = request.getParameter("name");
int eng = Integer.parseInt(request.getParameter("eng"));
int kor = Integer.parseInt(request.getParameter("kor"));
int math = Integer.parseInt(request.getParameter("math"));

ScoreBean sbean = new ScoreBean();
sbean.setName(name);
sbean.setEng(eng);
sbean.setKor(kor);
sbean.setMath(math);
%>
</head>
<body>
이름:<%=sbean.getName()%><br>
국어:<%=sbean.getKor()%><br>
영어:<%=sbean.getEng()%><br>
수학:<%=sbean.getMath()%><br>
총점:<%=sbean.getTotal() %><br>
평균:<%=sbean.getAvg() %><br>
학점:<%=sbean.getGrade() %>

</body>
</html>