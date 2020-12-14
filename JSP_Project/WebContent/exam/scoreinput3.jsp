<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<form action="scoreBeanResult.jsp" id="frm">
이름:<input type="text" name="name" id="name"><br>
국어:<input type="text" name="kor" id="kor"><br>
영어:<input type="text" name="eng" id="eng"><br>
수학:<input type="text" name="math" id="math"><br>
<input type="button" id="btn" value="button 전송">
</form>
<script>
    $(function(){
        $("#btn").click(function (){
            var name = $("#name").val();
            var kor = $("#kor").val();
            var eng = $("#eng").val();
            var math = $("#math").val();
            if(name==""){
                alert("이름을 입력하세요");
                return;
            }
            if(kor=="" || $.isNumeric(kor)==false){
                alert("국어점수를 입력하세요");
                return;
            }
            if(eng==""||$.isNumeric(eng)==false){
                alert("영어점수를 입력하세요");
                return;
            }
            if(math==""|| $.isNumeric(math)==false){
                alert("수학점수를 입력하세요");
                return;
            }
            var frm = $("#frm");
            frm.submit();
        });
    });
</script>
</body>
</html>