<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
Calendar ca = Calendar.getInstance();
int today = ca.get(Calendar.DAY_OF_WEEK);
String[] arr={"일","월","화","수","목","금","토"};
String day="";
day=arr[today-1];
/* switch(today){
case 1:day="일요일";break;
case 2:day="월요일";break;
case 3:day="화요일";break;
case 4:day="수요일";break;
case 5:day="목요일";break;
case 6:day="금요일";break;
	default: day="토요일";
} */
request.setAttribute("day", day);
%>
</head>
<body>

오늘은
<%=ca.get(Calendar.YEAR)%>년
<%=ca.get(Calendar.MONTH)+1 %>월
<%=ca.get(Calendar.DATE) %>일
${day}요일
<hr>
${day}요일

</body>
</html>