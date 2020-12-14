<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
아이디:<input type="text" name="userid" id="userid">
<input type="button" id="btnIdCheck" value="중복확인">
<div id="checkbox"></div>
<input type="button" id="useId" value="해당아이디 사용하기">

<script>
$(function(){
	$("#btnIdCheck").click(function(){
		var userid = $("#userid").val();
		var checkbox = $("#checkbox");
		$.ajax({
		    type:"post",
		    url:'userIdCheckPro.jsp',
		    data:{userid:userid},
		    success:function(data){
		        var result= data.trim();
		        if(result==1){
		            checkbox.css("color","red");
		            checkbox.text("중복된 아이디");
		        }else if(result==0){
		            checkbox.css("color","blue");
		            checkbox.text("사용가능");
		        }
		    },
		    error:function(e){
		        alert(e);
		    }
		});
	});
	$("#useId").click(function(){
		var userid = $("#userid").val();
		$(opener.document).find("#userid").val(userid);
		self.close();
	});
});
</script>
</body>
</html>

