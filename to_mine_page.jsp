<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>  
<%@page import="java.util.*"%>  
<%
	String customer_id =new String(request.getParameter("customer_id"));


	session.setAttribute("customer_id",customer_id);  
	response.sendRedirect("mine_page.jsp");  
	

%>