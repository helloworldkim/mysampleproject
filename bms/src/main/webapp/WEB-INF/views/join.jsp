<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--bootstrap css-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!--bootstrap js  -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
<title>BMS JOIN</title>
</head>
<body>
	<header></header>
	<nav class="navbar navbar-expand-lg bg-light">
		<a class="navbar-brand" href="/">BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">회원가입</li>
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class="container">
				<div class="row">
					<div class="col-sm">
						<form role="form" action="/member/join" method="post">
							<div class="form-group">
								<label for="userid">사용자아이디</label> <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력해주세요">
							</div>
							<div class="alert alert-danger" id="userid_dup">아이디가 중복되었습니다</div>
							<div class="alert alert-success" id="userid_uniq">아이디가 사용가능합니다</div>
							<div class="form-group">
								<label for="userpw">비밀번호</label> <input type="password" class="form-control" name="userpw" id="userpw" placeholder="비밀번호를 입력해주세요">
							</div>
							<div class="form-group">
								<label for="userpwChk">비밀번호 확인</label> <input type="password" class="form-control" id="userpwChk" placeholder="한번더 입력해주세요">
							</div>
							<div class="alert alert-danger" id="pwcheck_fail">비밀번호가 일치하지 않습니다</div>
							<div class="alert alert-success" id="pwcheck_success">비밀번호가 일치합니다</div>
							<div class="form-group">
								<label for="username">이름</label> <input type="text" class="form-control" name="username" id="username" placeholder="이름을 입력해주세요">
							</div>
							<div class="form-group">
								<label for="userphone">휴대폰번호</label> <input type="text" class="form-control" name="userphone" id="userphone" placeholder="휴대폰번호를 입력해주세요">
							</div>
							<div class="form-group text-center">
								<button type="button" id="join-submit" disabled="disabled" class="btn btn-primary">회원가입</button>
								<a href="/" type="button" class="btn btn-warning">취소</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>