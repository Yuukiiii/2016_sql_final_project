<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- word type -->
<link rel="stylesheet" type="text/css" href="css/materialize.min.css"  media="screen,projection"/>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>modify</title>
</head>
<body>
<script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>

 <div id="mine_page_friends" class="container">
    <div class="row">
        <div class="col s12">
            <div class="card-panel" style="padding-top: 30px;">
            
                    <div class="row">
                        <div class="col s12">
                            <div class="row">

                                <script>
                                    $(document).ready(function() {
                                        $('select').material_select();
                                    });
                                </script>

                                <div class="input-field col s3">
                                    <select name = "value">
                                        <option value="" disabled selected>选择更改内容</option>
                                        <option value="1">姓名</option>
                                        <option value="2">微信</option>
                                        <option value="3">电话</option>
                                        <option value="4">性别</option>
                                        <option value="5">生日</option>
                                        <option value="6">国籍</option>
                                        <option value="7">学校</option>
                                        <option value="8">专业</option>
                                        <option value="9">自我介绍</option>
                                        <option value="10">语言</option>
                                    </select>
                                </div>
                                
                                <%
	                               //String value=new String(request.getParameter("value"));
	                              String value = "5";  
                                if( value != "10"){
                                %>

                                <form>
                                    <div class="input-field col s9">
                                        <input id="search" type="search" required>
                                        <label for="search"><i class="material-icons">search</i></label>
                                        <i class="material-icons">close</i>
                                    </div>
                                </form>
                                <%
                               		 } 
	                                %>
	                                <%
	                                if( value == "10"){
	                                	 %>
					                <div class="input-field col s9"><select name ="language" multiple>
										<option value="" disabled selected>Choose your option</option>
										<option value="1">Chinese</option>
										<option value="2">English</option>
										<option value="3">Japanese</option>					
										<option value="4">Latin</option>
										<option value="5">French</option>
										<option value="6">Korean</option>
										<option value="7">Russian</option>
									</select>
									<label>Language</label>
								</div>
								<%
								} %>
	                                	

                            </div>

                        </div>
                    </div>
                    <%	
                    
                     	String type = new String();
                    	if(value=="1")
                    		type="customer_name";
                    	else if(value=="2")
                    		type="wechat";
                    	else if(value=="3")
                    		type="telephone";
                    	else if(value=="4")
                    		type="gender";
                    	else if(value=="5")
                    		type="date_of_birth";
                    	else if(value=="6")
                    		type="nationality";
                    	else if(value=="7")
                    		type="school";
                    	else if(value=="8")
                    		type="major";
                    	else if(value=="9")
                    		type="self_intro";
                    	else if(value=="10")
                    		type="language";
                    	
                    	Class.forName("com.mysql.jdbc.Driver").newInstance();
                    	String url ="jdbc:mysql://127.0.0.1:3306/sql_project?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
                    	Connection conn= DriverManager.getConnection(url);

                    	String customer_id = (String)session.getAttribute("customer_id");
                    	
                    	String sql ="select * from customer where customer_id = ?";
                     	PreparedStatement stmt=conn.prepareStatement(sql);
                     	stmt.setString(1,customer_id);
                    	ResultSet rs = stmt.executeQuery();	
                    %>
</body>
</html>