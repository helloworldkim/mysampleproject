<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a</title>
</head>
<body>
<%
String[] hobby = request.getParameterValues("hobby");
String temp="";
for(int i=0; i<hobby.length;i++){
	temp+= hobby[i]+" ";
}

%>

이름:${param.userName}
나이:${param.userAge}
성별:${param.gender}
관심분야:<%=temp %>
관심분야:${paramValues.hobby[0]} ${paramValues.hobby[1]} ${paramValues.hobby[2]} ${paramValues.hobby[3]}
직업:${param.job}

</body>
</html>