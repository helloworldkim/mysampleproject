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
			<div class="container text-center">
				<div>
					<form class="form-inline" action="/board/list" role="form" method="get">
						<input class="form-control input-md" type="text" name="searchText" placeholder="검색어를 입력하세요"> <input type="submit" class="btn btn-primary" value="검색">
					</form>
				</div>
				<div>
					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th>글번호</th>
								<th>글제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.id}</td>
									<td><a href="/board/content?id=${item.id}">${item.title}</a></td>
									<td>${item.createdBy}</td>
									<td>${item.hit}</td>
									<td>${item.createdAt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="paging"></div>
				<div id="write_button" class="text-write">
					<a href="/board/write" class="btn btn-primary">글쓰기</a>
				</div>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>