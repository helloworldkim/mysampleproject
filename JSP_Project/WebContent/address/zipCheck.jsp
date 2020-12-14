<%@page import="java.util.ArrayList"%>
<%@page import="com.address.ZipCodeDTO"%>
<%@page import="com.address.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a:link{text-decoration: none; color: #000}
a:hover{text-decoration: none; color: red;}
a:visited{text-decoration: none; color: #000}
</style>
<%
	request.setCharacterEncoding("utf-8");
	String dong = request.getParameter("dong");//서면
	AddressDAO addDAO = AddressDAO.getInstace();
	ArrayList<ZipCodeDTO> zipArr=addDAO.zipcodeRead(dong);
%>
<script type="text/javascript">
function dongCheck(){
	var dong = document.querySelector("#dong").value;
	console.log(dong);
	if(dong==""||dong==null){
		alert("동이름을 입력하세요");
		return;
	}
	frm.submit();
}
function send(zipcode,sido,gugun,dong,bunji) {
	var address = sido+" "+ gugun+ " " +dong + " "+bunji;
	var zipcode = zipcode;
	//자식창에서 부모를 부를때 사용하는것 opener ! frm은 부모의 form테그 name
/* 	opener.document.frm.zipcode.value=zipcode;
	opener.document.frm.addr.value=address; */
	opener.document.querySelector("#zipcode").value=zipcode;
	opener.document.querySelector("#addr").value=address;
	self.close();
	
}
</script>
</head>
<body>
<form id="frm" action="zipCheck.jsp">
	<table>
		<tr>
			<td>동이름입력:<input type="text" name="dong" id="dong">
			<input type="button" value="검색" onclick="dongCheck()">
			</td>
		</tr>
		<%if(zipArr.isEmpty()){%>
			<tr>
				<td>검색된 결과가 없습니다</td>
			</tr>
		<%}else{
		%>
			<tr>
				<td>검색 후, 아래 우편번호를 클릭하시면 자동으로 입력됩니다.</td>
			</tr>
		<%
		for(ZipCodeDTO z : zipArr){
			String zip = z.getZipcode();
			String sido = z.getSido();
			String gugun = z.getGugun();
			String d = z.getDong();
			String bunji = z.getBunji();
			if(sido==null){
				sido="";
			}
			if(gugun==null){
				gugun="";
			}
			if(bunji==null){
				bunji="";
			}
			%>
			<tr>
				<td><a href="javascript:send('<%=zip%>','<%=sido %>','<%= gugun%>','<%=d%>','<%=bunji%>')"><%=zip%> <%=sido %> <%=gugun %> <%=d%> <%=bunji %></a></td>
			</tr>
			<%
		}
	} %>
		
	</table>
</form>

</body>
</html>