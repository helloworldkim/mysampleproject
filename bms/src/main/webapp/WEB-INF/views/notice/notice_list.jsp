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
					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th>글번호</th>
								<th>글제목</th>
								<th>작성일</th>
								<th>작성자</th>
								<th>수정일</th>
								<th>수정자</th>
								<th>공지사항(Y,N)</th>
							</tr>
						</thead>
						
							<c:forEach var="item" items="${list}">
							
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td><a href="/notice/content?id=${item.id}">${item.title}</a></td>
									<td>${item.createdAt.toString().replace('T',' ')}</td>
									<td>${item.createdBy}</td>
									<td>${item.modifiedAt.toString().replace('T',' ')}</td>
									<td>${item.modifiedBy}</td>
									<c:if test="${item.noticeYn == 'Y'}">
										<c:set var="notice" value="공지사항" ></c:set>
										<td>${notice}</td>
									</c:if>
									<c:if test="${item.noticeYn == 'N'}">
										<c:set var="notice" value="게시글" ></c:set>
										<td>${notice}</td>
									</c:if>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="write_button" class="text-write">
					<a href="/notice/write" class="btn btn-primary">글쓰기</a>
				</div>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>