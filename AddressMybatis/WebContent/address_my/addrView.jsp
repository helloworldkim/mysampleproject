<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function zipfinder(){
	window.open("zipAction.amy","","width=700 height=400");
}
</script>
</head>
<body>
<a href="listAction.amy">전체보기</a>
<form action="updateAction.amy" method="post" name="frm"> 
<input type="hidden" name="num"  value="${address.num }">
<table>
		<tr>
				<td colspan="2">Servlet_Mybatis 상세보기</td>
		</tr>
		<tr>
				<td>이름</td>
				<td><input type="text" name="name"  value="${address.name }"></td>
		</tr>
		<tr>
				<td>우편번호</td>
				<td><input type="text" name="zipcode"  id="zipcode" size=7 value="${address.zipcode }">
						<input type="button" value="검색" onclick="zipfinder()">
				</td>
		</tr>
		<tr>
				<td>주소</td>
				<td><input type="text" name="addr" id="addr" size=50 value="${address.addr }"></td>
		</tr>
		<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" value="${address.tel }"></td>
		</tr>
		<tr>
		<td colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
				<input type="button" value="삭제"
				 onclick="location.href='deleteAction.amy?num=${address.num}'">
		</td>
		</tr>
</table>

</form>
</body>
</html>



