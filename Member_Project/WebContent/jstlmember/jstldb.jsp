<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String pwd = request.getParameter("pwd");
	String admin = request.getParameter("admin");
	String email = request.getParameter("email");
%>
<sql:setDataSource url="jdbc:oracle:thin:@localhost:1521:xe"
driver="oracle.jdbc.driver.OracleDriver" user="hr" password="1234"
var="ds1" scope="application"/>
<%-- <sql:query var="rs" sql="select * from member" dataSource="${ds1}"></sql:query>
<c:forEach items="${rs.columnNames}" var="columnName">
		<p>${columnName}</p>
</c:forEach>
<c:forEach var='i' items="${rs.rowsByIndex}">
	<c:forEach items="${i}" var="val">
		<p>${val}</p>
	</c:forEach>
</c:forEach> --%>
<!--데이터 소스가 미리 세팅되어있는경우는 이렇게 사용가능  -->
<sql:setDataSource  dataSource="jdbc/member" 
      var="dataSource"      scope="application"/>
<sql:update dataSource="${dataSource }">
insert into member(name, userid, pwd,email, phone, admin) 
 values(?,?,?,?,?,?)
	 <sql:param value="${param.name }" />
	 <sql:param value="<%=userid %>" />
	 <sql:param value="<%=pwd %>" />
	 <sql:param value="<%=email %>" />
	 <sql:param value="<%=phone %>" />
	<sql:param value="<%=admin %>" />
</sql:update>
<!--import하는법  -->
<c:import url="memberList.jsp"></c:import>
</body>
</html>