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
				<form action="/notice/update" method="post">
				<input type="hidden" name="id" value="${item.id}">
				<input type="hidden" name="modifiedBy" value="${sessionScope.USERID_SESSION}">
					<div class="form-group">
						<label for="title">글제목</label> 
						<input type="text" class="form-control" name="title" id="title" value="${item.title}">
					</div>
					<div class="form-group">
						<label for="content">글내용</label>
						<textarea name="content" id="content" style="width: 100%; height: 20rem;">${item.content}</textarea>
					</div>
					<div class="form-group">
						<label for="createdAt">작성일</label> 
						<input type="text" class="form-control" id="createdAt" readonly="readonly" value="${item.createdAt.toString().replace('T',' ')}">
					</div>
					<div class="form-group">
						<label for="modifiedAt">최종수정일</label> 
						<input type="text" class="form-control" id="modifiedAt" readonly="readonly" value="${item.modifiedAt.toString().replace('T',' ')}">
					</div>
					<div class="form-group">
						<label for="noticeYn">공지사항 여부 재설정(Y,N) <br/>현재 공지사항 여부:${item.noticeYn}</label> 
						<select name="noticeYn" class="form-control"  id="noticeYn">
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</div>
					<c:if test="${sessionScope.USERID_SESSION ne null}">
					<div class="form-group text-center">
						<input type="submit" class="btn btn-primary" value="수정"> 
						<a href="/notice/list" class="btn btn-warning">취소</a>
						<a href="/notice/delete?id=${item.id}" class="btn btn-danger">삭제</a>
					</div>
					</c:if>

				</form>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>