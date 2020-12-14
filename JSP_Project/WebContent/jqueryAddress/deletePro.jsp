<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	JAddressDAO dao = JAddressDAO.getInstace();
	dao.deleteList(num); //삭제 실행
	ArrayList<AddressVO> arr =dao.addrList(); //삭제 후 전체 리스트를 리턴
	int count = dao.addrCount();
	JSONArray jarr = new JSONArray();
	
	for(AddressVO a : arr){
		//JSON Object 생성
		JSONObject obj = new JSONObject();
		obj.put("num",a.getNum());
		obj.put("name",a.getName());
		obj.put("addr",a.getAddr());
		obj.put("tel",a.getTel());
		jarr.add(obj);
	}
	JSONObject countObj = new JSONObject();
	countObj.put("count",count);
	
	JSONObject mainObject = new JSONObject();
	mainObject.put("array",jarr);
	mainObject.put("count",countObj);
	
	out.println(mainObject.toJSONString());
%>