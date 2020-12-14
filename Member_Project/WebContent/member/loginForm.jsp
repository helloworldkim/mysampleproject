<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="container">
    <nav class="pull-right"><a href="memberList.jsp">전체보기</a></nav>
        <h1>로그인</h1>
<form action="memberPro.jsp" id='frm' method="post">
    <div class="form-group">
        <label for="userid">아이디:</label>
        <input type="text" class="form-control" id='userid' name="userid">
    </div>
    <div class="form-group">
        <label for="">비밀번호:</label>
        <input type="password" class="form-control" id="pwd" name="pwd">
    </div>
    <input type="button" class="btn btn-primary" value="로그인" id="loginBtn">
    <input type="reset" class="btn btn-primary" value="취소">
    <input type="button" class="btn btn-primary" value="회원가입" onclick="location.href='memberForm.jsp'">
	</form>
</div>
<script>
    $(function(){
        $("#loginBtn").click(function(){
            var userid = $('#userid');
            var pwd = $('#pwd');
            
            if(userid.val()==""){
                alert("아이디를 입력해주세요")
                userid.focus();
                return;
            }
            if(pwd.val()==""){
                alert("비밀번호를 입력해주세요");
                pwd.focus();
                return;
            }
            $.ajax({
                type:'post',
                url:'loginPro.jsp',
                data:{userid:userid.val(),pwd:pwd.val()},
                success:function(data){
                	var result = data.trim();
                    if(result==-1){
                        alert("아이디가 틀렸습니다");
                        userid.focus();
                        return;
                    }
                    if(result==2){
                        alert("비밀번호가 틀렸습니다");
                        pwd.focus();
                        return;
                    }
                    if(result==1){
                        alert("관리자계정입니다");
                        $(location).attr("href","memberList.jsp");
                        return;
                    }
                    if(result==0){
                        alert("일반계정입니다");
                        $(location).attr("href","memberView.jsp");
                        return;
                    }
                    
                },
                error:function(e){
                    alert("error:"+e);
                }
            });
        });        
    });
</script>
</body>
</html>