<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.jqueryAddress.ZipCodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jqueryAddress.JAddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//String dong = request.getParameter("dong");
	String dong = "서면";
	JAddressDAO dao = JAddressDAO.getInstace();
	ArrayList<ZipCodeVO> zarr= dao.getZipCode(dong);
	//JSON으로 변환해서 보내야함
	JSONArray jarr = new JSONArray();
	for(ZipCodeVO z : zarr){
		//JSON Object 생성
		JSONObject obj = new JSONObject();
		obj.put("zipcode", z.getZipcode());
		obj.put("sido", z.getSido());
		obj.put("gugun", z.getGugun());
		obj.put("dong", z.getDong());
		obj.put("bunji", z.getBunji());
		jarr.add(obj);

	}
	out.println(jarr.toJSONString());
%>