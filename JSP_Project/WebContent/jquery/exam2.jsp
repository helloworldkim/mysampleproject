<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
id:<input type="text" id="id" name="id">
pwd:<input type="password" id="pwd" name="pwd">
<input type="submit" value="get전송" id="getBtn">
<input type="submit" value="post전송" id="postBtn">
<input type="submit" value="load전송" id="loadBtn">
<input type="submit" value="ajax전송" id="ajaxBtn">
<div id="result"></div>
<div id="result1"></div>
<div id="result2"></div>
<table class="table table-hover">
<thead class="thead-dark">
	<tr>
		<th>id</th>
		<th>pwd</th>
	</tr>
</thead>
<tbody id="table">
</tbody>
</table>

<script>
$(document).ready(function(){
    $("#getBtn").click(function(){
        var id = $("#id").val();
        var pwd = $("#pwd").val();
        //url,data값,
      	$.get("process.jsp",{"id":id,"pwd":pwd,"method":"get"})
      	.done(function(data){
        	$("#result").html(data);
        });        
    });
    
    $("#postBtn").on("click",function(){
        var id = $("#id").val();
        var pwd = $("#pwd").val();
    	$.post("process.jsp",{"id":id,"pwd":pwd,"method":"post"},function(data){
            $("#result1").html(data);
        });
    });
    
    $("#loadBtn").on("click",function(){
    	var id = $("#id").val();
        var pwd = $("#pwd").val();
        $("#result").load("process.jsp",{"id":id,"pwd":pwd,"method":"post"},function(data){
        	alert(data);
        });
    });
    
    $("#ajaxBtn").on("click",function(){
    	var id = $("#id").val();
        var pwd = $("#pwd").val();
    $.ajax({
	type:'post',
	url:'exam2Pro.jsp',
	data:{
		id:id,
	    pwd:pwd,
	    method:"ajax"},
	    dataType:"JSON",//데이터타입 명시안될때 json타입 인식못함
	success: function(resp){
		var result = resp.result;
		console.log(result);
		var table = document.querySelector("#table");
		table.innerHTML="";
		for(var i=0; i<result.length; i++){
			var row = table.insertRow(0); //0번째에 테이블 tr하나를 만들고!
			for(var j=0; j<result[i].length; j++){
				var cell = row.insertCell(j);
				cell.innerText = result[i][j].value;
			}
		}
	},error: function(e){
		alert("error:"+e);
		
	}
		
		});
    });
    
});
    

</script>
</body>
</html>