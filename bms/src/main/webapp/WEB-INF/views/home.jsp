<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--bootstrap css-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!--bootstrap js  -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>BMS HOME</title>
</head>
<body>
	<header></header>
	<nav class="navbar navbar-expand-lg bg-light">
		<a class="navbar-brand" href="/">BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<c:if test="${sessionScope.USERID_SESSION eq null}">
					<li class="nav-item"><a href="/member/login" class="nav-link">로그인</a></li>
					<li class="nav-item"><a href="/member/join" class="nav-link">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.USERID_SESSION ne null}">
					<li class="nav-item"><a href="/member/logout" class="nav-link">로그아웃</a></li>
					<li class="nav-item"><a href="/board/list" class="nav-link">게시판</a></li>
					<li class="nav-item"><a href="/notice/list" class="nav-link">공지사항</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class="container">
				<div class="row">
					<div class="col-sm" style="background-color: green">할로</div>
					<div class="col-sm" style="background-color: red">할로</div>
					<div class="col-sm" style="background-color: blue">할로</div>
				</div>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>