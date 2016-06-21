<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="chen.*" %>    
<%@page import="java.sql.*" %>  
<%@page import="java.util.*"%>  
<jsp:useBean id="userBean" class="chen.UserBean" scope="request">  
<jsp:setProperty name="userBean" property="*"/>  
</jsp:useBean>  
<jsp:useBean id="regist" class="chen.UserRegister" scope="request"/>  
<html>  
<head>  
<title></title>  
<meta http-equiv="Content-Type"">  
</head>  
<body>  
  
<%
	
	String password = request.getParameter("password");  
	String email  = request.getParameter("e_mail");
	
	

	String url1 ="jdbc:mysql://127.0.0.1:3306/sql_project?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
	Class.forName("com.mysql.jdbc.Driver");  
 	Connection con=DriverManager.getConnection(url1);  
 	String sql="select e_mail from user where e_mail =? ";  
 	PreparedStatement stmt=con.prepareStatement(sql);
 	stmt.setString(1,email);
 	ResultSet rs = stmt.executeQuery();
 	boolean flag=true;
 	if(rs.next()){
  		 String message = "该用户名已经注册！请重新编辑！";
 		 out.println(message);
 		out.println(" <a href='register.jsp'>返回</a>");
 		flag=false;
 	}
 	
 	if(flag){
		
		userBean.setEmail(email);
		
  
		userBean.setPassword(password);  
		//System.out.println(userid+password); 
		
		try
		{  
  			regist.setUserBean(userBean);  
  			//out.println(userid);  
  			regist.regist();  
  			//out.println("注册成功");
  			session.setAttribute("e_mail",email);
  			response.sendRedirect("userinformation.jsp");
  			
  		}  
  			catch(Exception e)
		{  
  			out.println(e.getMessage());  
 		}  
 	}
%>
</body>  
</html>  