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
<!-- b1 get방식 -->
<button id="b1">결과1</button>
<!-- b2 post방식 -->
<button id="b2">결과2</button>
<!--b3 fetch 방식  -->
<button id="b3">결과3</button>
<div id="result"></div>

<script>
    $(document).ready(function(){
        $("#b1").on("click",function(){
            $.get("test.txt",function(data,status){
                var str = "데이터 :"+data+"\n상태:"+status;
                $("#result").text(str);
            });
        });//b1
        $("#b2").on("click",function(){
            var htmlStr="";
            $.getJSON("test.txt",function(data){
            		//오브젝트 , function index값 item값(순서대로 0,1의 오브젝트)
                $.each(data,function(key,val){
                    //htmlStr =`회원번호 : ${val.memberNumber} <br> 이름 : ${val.irum} <br> 이미지: ${val.picture}<hr>`
                    htmlStr +='회원번호 :'+val.memberNumber+ '<br>';
                    htmlStr +=  '이름 :'+ val.irum+' <br>';
                    htmlStr +=  '이미지:'+ val.picture+'<hr>';
                    console.log(data);

                })
                $('#result').html(htmlStr);
            })
        });
        $("#b3").on("click",function(){
            $.get("test.txt",function(data,status){
                var d = JSON.parse(data);
                var str = "";
                for(i=0; i<d.length;i++){
                    str+= "이름:"+d[i].irum+"<br>";
                }
                $("#result").html(str);
            });
        });
       
    });
</script>
<!-- <script>
    function display(json){
        return 
    }
   $(document).ready(function(){
        $("#b3").on("click",function(){
            fetch('test.txt')
            .then(resp =>resp.json())
            .then(json =>$("#result").text(display(json)));

        });
   });
</script> -->
</body>
</html>