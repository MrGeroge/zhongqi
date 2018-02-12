<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String result=(String)request.getAttribute("result");
    String mesg=(String)request.getAttribute("message");
    JSONObject json=new JSONObject();
    json.put("status", result);
    json.put("message", mesg);
%>
<%=json.toString()%>