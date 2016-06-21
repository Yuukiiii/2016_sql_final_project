<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>  
<%@page import="java.util.*"%>  
<%  
  String e_mail1=request.getParameter("e_mail");  
  String password1=request.getParameter("password");  
  String url1 ="jdbc:mysql://127.0.0.1:3306/sql_project?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
  
 try{
 		Class.forName("com.mysql.jdbc.Driver");  
 		Connection con=DriverManager.getConnection(url1);  
 		String sql="select * from admin where admin_id=?";
 	 	PreparedStatement stmt=con.prepareStatement(sql); 
 		stmt.setString(1,e_mail1);
 		ResultSet rs=stmt.executeQuery();  
 		while(rs.next())  
  		{	
			String e_mail=rs.getString("admin_id").trim();  
			String password=rs.getString("admin_password").trim();  
			
	 		if(e_mail.equals(e_mail1))
	 		{
	 			if(password.equals(password1))
	 			{
	  			session.setAttribute("admin_id",e_mail1);  
	  			response.sendRedirect("admin.jsp");  
	  			/*System.out.println("success for admin!");*/
	 			}
	  			else  
				{
	  	  			 String message = "用户名或密码错误！请重新输入！";
	  	 			 out.println(message);
	  	 			out.println("<a href='index.html'>返回</a>");
				} 
	 		}
  		}
	 	 		String sql2="select * from user where e_mail=?";  
	 	 		PreparedStatement stmt2=con.prepareStatement(sql2); 
	 	 		stmt2.setString(1,e_mail1);
	 	 		ResultSet rs2=stmt2.executeQuery();  
	 	 		while(rs2.next())  
	 	  		{	
	 	 			String e_mail=rs2.getString("e_mail").trim();  
	 				String password=rs2.getString("password").trim();  
	 				
	 		 		if(e_mail.equals(e_mail1))
	 		 		{
	 		 			if(password.equals(password1))
	 		 			{
	 			  			session.setAttribute("customer_id",e_mail1);  
	 			  			response.sendRedirect("mine_page.jsp");  
	 			  			/* System.out.println("success for user!");*/
	 		 			}	  
	 		  			else  
	 					{
	 		  	  			 String message = "用户名或密码错误！请重新输入！";
	 		  	 			 out.println(message);
	 		  	 			out.println("<a href='index.html'>返回</a>");
	 					}
	 		 		}
	 		 	}
	 		
	 	
 }
 
 catch(Exception e){
	 System.out.println(e.getMessage());
 }
 	  	 
%>