$(document).ready(function(){
    //tr마다 이벤트 생성
    $("#area").on("click","tr",function(){
        //alert($(this).text());
        var address = $("td:eq(1)",this).text()+" "+$("td:eq(2)",this).text()+" "+$("td:eq(3)",this).text()+" "+$("td:eq(4)",this).text();
        var zipcode = $("td:eq(0)",this).text();
        $(opener.document).find("#zipcode").val(zipcode);
        $(opener.document).find("#addr").val(address);
		self.close();
    });

    //js만 사용해서 만들기 고치는중
    // $("#area").on("click",function(e){
        
    //     if(e.target.nodeName!="TD") return;
    //     console.log(e.target.nodeName);
    //     var tr = e.target.parentNode;
    //     console.log(tr.childNodes);
	// 	self.close();
    // });

    //템플릿
    function createHtmlString(item){
        return `
            <tr>
                <td>${item.zipcode}</td>
                <td>${item.sido}</td>
                <td>${item.gugun}</td>
                <td>${item.dong}</td>
                <td>${item.bunji}</td>
            </tr>
        `
    }
    //태그써서 생성후 값넣기
    $("#send").click(function(){
        var dong = $("#dong").val();
        $.getJSON("zipCheckPro.jsp",{"dong":dong},function(data){
            //테이블 컨테이너
            var container = document.querySelector("#area");
            container.innerHTML=data.map(item => createHtmlString(item)).join('').replace(/null/gi,"");
        });
    });

    /* $("#send").click(function(){
        var dong = $("#dong").val();
       $.get("zipCheckPro.jsp",{"dong":dong},
       function(data){
          var d=JSON.parse(data);

          var htmlStr = "<table>";
          for(var i=0; i<d.length;i++){
            htmlStr+="<tr>";
            htmlStr+="<td>"+d[i].zipcode+"</td>";
            htmlStr+="<td>"+d[i].sido+"</td>";
            htmlStr+="<td>"+d[i].gugun+"</td>";
            htmlStr+="<td>"+d[i].dong+"</td>";
            htmlStr+="<td>"+d[i].bunji+"</td>";
            htmlStr+="</tr>";
          }
          htmlStr+="</table>";
          $("#area").html(htmlStr);
          //이렇게 만들면 한개의 td에 다 들어가버림
        var table = document.createElement("table");
        for(var i=0; i<d.length;i++){
            var tr = document.createElement("tr");
            var td = document.createElement("td");
            var zipcode = d[i].zipcode;
            console.log(zipcode);
            td.append(zipcode);
            tr.append(td);
            table.append(tr);
            
        }
        $("#area").append(table);
       });
    }); */

});