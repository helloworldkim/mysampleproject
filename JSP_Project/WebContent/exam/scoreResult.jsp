<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
if(request.getParameter("kor")=="" ||request.getParameter("kor")==null){
	int kor=0;
}
if(request.getParameter("eng")=="" ||request.getParameter("eng")==null){
	int kor=0;
}
if(request.getParameter("math")=="" ||request.getParameter("math")==null){
	int kor=0;
}
int kor = Integer.parseInt(request.getParameter("kor"));
int eng = Integer.parseInt(request.getParameter("eng"));
int math = Integer.parseInt(request.getParameter("math"));
int total = kor+eng+math;
int avg = total/3;
String grade="";
if(avg>=90){
	grade="A";	
}else if(avg>=80){
	grade="B";
}else if (avg>=70){
	grade="C";
}else{
	grade="F";
}
/* switch(avg/10){
case 10:
case 9: grade="A"; break;
case 8:	grade="B"; break;
case 7:	grade="C"; break;
default:grade="F";
} */
request.setAttribute("total", total);
request.setAttribute("avg", avg);
request.setAttribute("grade", grade);

%>
<body>
이름:${param.name}<br>
국어:${param.kor}<br>
영어:${param.eng}<br>
수학:${param.math}<br>
총점:${total}<br>
평균:${avg}<br>
학점:${grade}
</body>
</html>