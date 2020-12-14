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
<title>BMS BOARD</title>
</head>
<body>
	<header></header>
	<nav class="navbar navbar-expand-lg bg-light">
		<a class="navbar-brand" href="/">BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a href="/board/list" class="nav-link">게시판</a></li>
				<li class="nav-item"><a href="/notice/list" class="nav-link">공지사항</a></li>
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class="container">
				<form action="/notice/write" method="post">
					<div class="form-group">
						<label for="title">글제목</label> 
						<input type="text" class="form-control" name="title" id="title" required autofocus placeholder="제목을 입력해주세요">
					</div>
					<div class="form-group">
						<label for="content">글내용</label>
						<textarea name="content" id="content" required placeholder="내용을 입력해주세요" style="width: 100%; height: 20rem;"></textarea>
					</div>
					<div class="form-group">
						<label for="createdBy">작성자</label> 
						<input type="text" class="form-control" name="createdBy" id="createdBy" readonly="readonly" value="${sessionScope.USERID_SESSION}">
					</div>
					<div class="form-group">
						<label for="noticeYn">공지사항(Y,N)</label> 
						<select name="noticeYn" class="form-control"  id="noticeYn">
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</div>
					<div class="form-group text-center">
						<input type="submit" class="btn btn-primary" value="저장"> 
						<a href="/notice/list" class="btn btn-warning">취소</a>
					</div>

				</form>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>