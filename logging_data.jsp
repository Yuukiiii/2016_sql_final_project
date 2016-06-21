<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%
	//装载MySQL5.5的JDBC驱动
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	//建立数据库连接
	String url ="jdbc:mysql://127.0.0.1:3306/sql_project?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
	Connection conn= DriverManager.getConnection(url);
	//建立一个Statement对象，用于执行SQL语句
	//执行查询并得到查询结果	  
	
	String customer_id = (String)session.getAttribute("customer_id") ;
	
	String customer_name = new String(request.getParameter("name"));
	String wechat =new String(request.getParameter("wechat"));
	String telephone =new String(request.getParameter("telephone")); 
	String gender =new String(request.getParameter("gender")); 
	String date_of_birth =new String(request.getParameter("date_of_birth")); 
	String nationality =new String(request.getParameter("nationality")); 
	String school =new String(request.getParameter("school")); 
	String major =new String(request.getParameter("major")); 
	String self_intro =new String(request.getParameter("self_intro")); 
	
	String[] language_id = request.getParameterValues("language");
	
	String sql1="update customer set customer_name=?,telephone=?,gender=?,date_of_birth=?,nationality=?,school=?,major=?,self_intro=?,customer_pic=?,wechat=? where customer_id=? ";
	String sql2="insert into customer_language values(?,?)";
	try{
		PreparedStatement pstmt=conn.prepareStatement(sql1);  
    	pstmt.setString(1,customer_name);  
	    pstmt.setString(2,telephone);  
	    pstmt.setString(3,gender);  
	    pstmt.setString(4,date_of_birth);  
	    pstmt.setString(5,nationality);  
	    pstmt.setString(6,school);  
	    pstmt.setString(7,major);  
	    pstmt.setString(8,self_intro);
	    pstmt.setString(9,"NULL");
	    pstmt.setString(10,wechat);
	    pstmt.setString(11,customer_id);
	    pstmt.executeUpdate();  
	    
	    if(language_id.length!=0){
			PreparedStatement pstmt2=conn.prepareStatement(sql2);
			for(int i =0 ;i<language_id.length;i++){
				pstmt2.setString(1,customer_id);
				pstmt2.setString(2,language_id[i]);
			    pstmt2.executeUpdate();  
			}
		  }
		
		


		session.setAttribute("customer_id",customer_id);
		response.sendRedirect("mine_page.jsp");
	}
	catch(Exception e){

			out.println(e.getMessage());  
			out.println(customer_name);
			out.println(customer_id);
	}

	
  	%>
</head>
<body>
</body>
</html>