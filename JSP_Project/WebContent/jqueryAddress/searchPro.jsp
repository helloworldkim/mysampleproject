<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.jqueryAddress.AddressVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String field = request.getParameter("field");
	String word = request.getParameter("word");
	JAddressDAO dao = JAddressDAO.getInstace();
	ArrayList<AddressVO> sarr =dao.getSearchList(field, word); //얻어지는값은 자바 arrayList배열
	int count = dao.getSearchCount(field, word);
	
	JSONArray jarr = new JSONArray();
	
	for(AddressVO a : sarr){
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
	//jarr.add(obj);
	//out.println(jarr.toJSONString());
	out.println(mainObject);

	
%>