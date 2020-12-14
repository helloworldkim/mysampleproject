$(function(){
	
	function createHtmlStr(data){
    return`
    <tr>
	<td>${data.name}</td>
	<td>${data.userid}</td>
	<td>${data.phone}</td>
	<td>${data.email}</td>
	<td>${data.admin}</td>
	<td><a href="#" onclick="del('${data.userid}')">삭제</a></td>
	</tr>
    `;
	}
	$('a[href="#"]').click(function(e) {
		e.preventDefault();
	});
	$('table tbody tr td a')

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
		// var htmlStr="";
		// $.each(result,function(key,val){
		// 	htmlStr += "<tr>";
		// 	htmlStr += "<td>"+val.name+"</td>";
		// 	htmlStr += "<td>"+val.userid+"</td>";
		// 	htmlStr += "<td>"+val.phone+"</td>";
		// 	htmlStr += "<td>"+val.email+"</td>";
		// 	htmlStr += "<td>"+val.admin+"</td>";
		// 	htmlStr += "<td>삭제</td>";
		// 	htmlStr += "</tr>";
		// });
		// $("table tbody").html(htmlStr);
		$("#countSpan").text(count);
	});
	
	}
});