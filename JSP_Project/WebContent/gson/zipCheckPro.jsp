<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
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
	String dong = request.getParameter("dong");
	//String dong = "서면";
	JAddressDAO dao = JAddressDAO.getInstace();
	ArrayList<ZipCodeVO> zarr= dao.getZipCode(dong);
	//JSON으로 변환해서 보내야함
	HashMap<String,Object> map = new HashMap<>();
	map.put("arr", zarr);
	Gson gson = new Gson();
	String obj = gson.toJson(map);
	out.println(obj);
%>