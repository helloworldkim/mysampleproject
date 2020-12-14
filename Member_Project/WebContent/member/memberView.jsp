<%@page import="org.member.dto.MemberDTO"%>
<%@page import="org.membe.dao.MemberDAOImpl"%>
<%@page import="org.membe.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%	
	String userid = (String)session.getAttribute("userid");
	MemberDAO dao = MemberDAOImpl.getInstance();
	MemberDTO member = dao.findById(userid);
%>
<h1>${userid}님 반값습니다</h1>
<h3>회원정보 변경 / <a href="userDelete.jsp">회원탈퇴</a></h3>
<input type="hidden" name="userid" id="userid" value=<%=member.getUserid()%>>
<table>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name" value="<%=member.getName()%>"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="pwd" name="pwd" id="pwd" value="<%=member.getPwd()%>"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="email" name="email" id="email" value="<%=member.getEmail()%>"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="phone" id="phone" value="<%=member.getPhone()%>"></td>
	</tr>
	<tr>
		<td>등급</td>
   		<td><input type="radio" class="form-check-input" name='admin' value="0">일반회원
   		<input type="radio" class="form-check-input" name='admin' value="1" >관리자</td>
	</tr>
</table>
	<script>
	if(<%=member.getAdmin()%>==0){
		$("input:radio[value='0']").prop("checked",true);
	}else{
		$("input:radio[value='1']").prop("checked",true);
	}
	</script>
	<button id='btn'>수정</button>
	<input type="reset" value="취소">
<a href="logout.jsp">로그아웃</a>
<script>
	$(function(){
		$("#btn").click(function(){
			//var userid = "<%=userid%>";
			var userid = $("#userid");
			var pwd = $("#pwd");
			var name = $("#name");
			var email = $("#email");
			var phone = $("#phone");
			$.ajax({
            type:"post",
            data:{userid:userid.val(),name:name.val(),pwd:pwd.val(),email:email.val(),phone:phone.val()},
            url:'memberUpdate.jsp',
            success:function(data){
                var result = data.trim();
                if(result==1){
                    alert("수정성공");
                    location.href='memberView.jsp';
                }else{
                    alert("수정실패");
                }
            },
            error:function(e){
                alert(e);
            }
      	  });
		});
	});
</script>
</body>
</html>