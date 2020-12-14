<%@page import="java.util.List"%>
<%@page import="com.user.userDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="test.mybatis.SqlMapConfig"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name ="";
	if(request.getParameter("name")!=null){
		name = request.getParameter("name");
	}
	SqlSessionFactory sessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession = sessionFactory.openSession();
	//List<userDTO> list = sqlSession.selectList("selectAllMember");
	List<userDTO> list = sqlSession.selectList("selectOneMember",name);
	request.setAttribute("list", list);

%>
<c:forEach items="${list}" var="dto" varStatus="st">
	<p>${dto.id}</p>
	<p>${dto.name }</p>
	<p>${dto.age }</p>
</c:forEach>
</body>
</html>