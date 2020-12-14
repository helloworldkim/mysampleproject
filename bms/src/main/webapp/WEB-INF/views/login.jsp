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
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.1.1">
<title>Signin Template · Bootstrap</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href="/docs/4.5/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/4.5/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.5/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/4.5/assets/img/favicons/safari-pinned-tab.svg"
	color="#563d7c">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon.ico">
<meta name="msapplication-config"
	content="/docs/4.5/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

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
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<form class="form-signin" role="form" action="" method="post">
					<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
					<label for="userid" class="sr-only">사용자아이디</label> <input
						type="text" id="userid" name="userid" class="form-control"
						placeholder="아이디를 입력하세요" required autofocus>
						<label for="userpw" class="sr-only">비밀번호</label> 
						<input type="password" id="userpw" name="userpw" class="form-control"
						placeholder="비밀번호를 입력하세요" required>
					<div class="checkbox mb-3">
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
					<p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>