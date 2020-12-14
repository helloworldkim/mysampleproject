<%@page import="java.io.PrintWriter"%>
<%@page import="org.membe.dao.MemberDAO"%>
<%@page import="org.member.dto.MemberDTO"%>
<%@page import="org.membe.dao.MemberDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script srd=""></script>
</head>
<body>
<%	
	if(session.getAttribute("userid")==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자님 로그인해주세요')");
		script.println("location.href='loginForm.jsp'");
		script.println("</script>");
	}
	String userid = (String)session.getAttribute("userid");
	MemberDAO memberDAO = MemberDAOImpl.getInstance();
	ArrayList<MemberDTO> memberList = memberDAO.memList(); //전체회원 리스트에 받음
	int cnt = memberDAO.getCount();
%>
<div class="container">
<div>
<h1><a href="memberView.jsp"><%=userid%></a>님 반갑습니다</h1>
<p>전체회원수:<span id='countSpan'><%=cnt%></span></p>
</div>
<nav class="pull-right">
	<a href="logout.jsp">로그아웃</a>
	<a href="memberForm.jsp">회원가입</a>
</nav>
<table class="table table-hover">
	<thead>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>구분</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<% for(MemberDTO member : memberList){
	String mode = member.getAdmin()==0?"일반회원":"관리자";%>
	
		<tr>
			<td><%=member.getName()%></td>
			<td><a href='memberDetail.jsp?userid=<%=member.getUserid()%>'><%=member.getUserid()%></a></td>
			<td><%=member.getEmail()%></td>
			<td><%=member.getPhone()%></td>
			<td><%=mode%></td>
			<td><a href="#" onclick="javascript:del('<%=member.getUserid()%>','<%=mode%>')">삭제</a></td>
		</tr>
	<%} %>
	</tbody>
</table>
</div>
<script>
//jsp에서는 $기호를 el문으로 생각함! \$와 함께 사용해야만함 ㅠㅠ 내 1시간....
function createHtmlStr(data){
    return`
    <tr>
	<td>\${data.name}</td>
	<td><a href='memberDetail.jsp?userid=\${data.userid}'>\${data.userid}</a></td>
	<td>\${data.email}</td>
	<td>\${data.phone}</td>
	<td>\${data.admin}</td>
	<td><a href="#" onclick="javascript:del('\${data.userid}')">삭제</a></td>
	</tr>
    `
} 

$('a[href="#"]').click(function(e) {
	e.preventDefault();
});

	function del(userid,mode){
		if(mode=="관리자"){
			alert("관리자는 삭제할수 없습니다");
			return;
		}
	$.getJSON("memberDelete.jsp",{"userid":userid},
	function(data){
		var table = document.querySelector("table tbody");
		var result = data.array;
		var count = data.count.count;
		table.innerHTML=result.map(item => createHtmlStr(item)).join('');
		/* var htmlStr="";
		$.each(result,function(key,val){
			htmlStr += "<tr>";
			htmlStr += "<td>"+val.name+"</td>";
			htmlStr += "<td>"+val.userid+"</td>";
			htmlStr += "<td>"+val.email+"</td>";
			htmlStr += "<td>"+val.phone+"</td>";
			htmlStr += "<td>"+val.admin+"</td>";
			htmlStr += "<td><a href=javascript:del('"+val.userid+"','"+val.admin+"')>삭제</a></td>";
			htmlStr += "</tr>";
		});
		$("table tbody").html(htmlStr); */
		$("#countSpan").text(count);
	});
}
	
</script>

</body>
</html>