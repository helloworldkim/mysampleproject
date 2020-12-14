function createHtmlStr(data){
    return`
        <tr>
            <td>${data.num}</td>
            <td><a href="detail.jsp?num=${data.num}">${data.name}</a></td>
            <td>${data.addr}</td>
            <td>${data.tel}</td>
            <td><input type="button" value="삭제" class="delBtn" data-num=${data.num}></td>
        <tr>
    `
}


$(document).ready(function(){
    $("#btnSearch").click(function(){
        var target = document.querySelector("#target");
        var field = $("#field").val();
        var word = $("#word").val();
        $.ajax({
            type:"get",
            url: "searchPro.jsp",
            data: {"field":field,"word":word},
            success:function(data){
                var data = JSON.parse(data);
                var result =data.array;
                var count = data.count;
                target.innerHTML=result.map(item => createHtmlStr(item)).join('');
                $("cntSpan").text(count.count);
            },
            error:function(e){
                alert("error:"+e);
            }
        });
    });

    // $("#btnSearch").click(function(){
    //     var target = $("#target");
    //     var field = $("#field").val();
    //     var word = $("#word").val();
    //     $.ajax({
    //         type:"get",
    //         url: "searchPro.jsp",
    //         data: {"field":field,"word":word},
    //         success:function(data){
    //             //console.log(data);
    //             var data = JSON.parse(data);
    //             var result =data.array;
    //             var count = data.count;
    //             var htmlStr ="";
    //             for(var i=0; i<result.length;i++){
    //                 htmlStr+="<tr>";
    //                 htmlStr+="<td>"+result[i].num+"</td>";
    //                 htmlStr+="<td><a href=detail.jsp?num="+result[i].num+">"+result[i].name+"</a></td>";
    //                 htmlStr+="<td>"+result[i].tel+"</td>";
    //                 htmlStr+="<td>"+result[i].addr+"</td>";
    //                 htmlStr+="</tr>";
    //               }
    //             $.each(result,function(key,val){
    //                 htmlStr+="<tr>";
    //                 htmlStr+="<td>"+val.num+"</td>";
    //                 htmlStr+="<td><a href=detail.jsp?num="+val.num+">"+val.name+"</a></td>";
    //                 htmlStr+="<td>"+val.tel+"</td>";
    //                 htmlStr+="<td>"+val.addr+"</td>";
    //                 htmlStr+="</tr>";
    //             });
    //               target.html(htmlStr);
    //               Str=count.count;
    //               $("#cntSpan").text(Str);
    //         },
    //         error:function(e){
    //             alert("error:"+e);
    //         }
    //     });
    // });

    $(".delBtn").click(function(e){
        var target = e.target;
        var num = target.dataset.num;
        var table = document.querySelector("#target");
        $.ajax({
            type:'get',
            url:'deletePro.jsp',
            data:{"num":num},
            success:function(data){
                var data = JSON.parse(data);
                var result =data.array;
                var count = data.count.count;
                table.innerHTML=result.map(item => createHtmlStr(item)).join('');
                document.querySelector("#cntSpan").innerHTML=count;
            },
            error:function(e){
                alert("error:"+e);
            }
        });

    });
});