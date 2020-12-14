<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberForm</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="member.js"></script>
<style>
    sup{
        color: red;
    }
</style>

</head>
<body>
    
<div class="container">
    <nav class="pull-right"><a href="memberList.jsp">전체보기</a></nav>
        <h1>회원가입</h1>
    <p>'<sup>*</sup>'표시 항목은 필수 입력항목입니다</p>
<form action="memberPro.jsp" id='frm' method="post">
    <div class="form-group">
        <label for="name">이름:</label>
        <input type="text" class="form-control" id="name" name="name">
    </div>
    <div class="form-group">
        <label for="userid">아이디:</label>
        <input type="text" class="form-control" id='userid' name="userid">
        <input type="button" id="idCheck" class="btn btn-primary pull-right" value="중복체크">
        <div id="checkbox"></div>

    </div>
    <div class="form-group">
        <label for="">비밀번호:</label>
        <input type="password" class="form-control" id="pwd" name="pwd">
    </div>
    <div class="form-group">
        <label for="pwd_check">비밀번호 확인:</label>
        <input type="password" class="form-control" id="pwd_check" name="pwd_check">
    </div>
    <div class="form-group">
        <label for="email">이메일:</label>
        <input type="email" class="form-control" id="email" name="email">
    </div>
    <div class="form-group">
        <label for="phone">휴대폰:</label>
        <input type="text" class="form-control" id="phone" name="phone">
    </div>
    <div class="form-check-inline">
  		<label class="form-check-label">
   		 <input type="radio" class="form-check-input" name='admin' value="0" checked>일반회원
  		</label>
  		<label class="form-check-label">
   		 <input type="radio" class="form-check-input" name='admin' value="1" >관리자
  		</label>
	</div>
    <input type="button" class="btn btn-primary" value="가입" id="send">
    <input type="reset" class="btn btn-primary" value="취소">
	</form>
</div>   	

    
</body>
</html>