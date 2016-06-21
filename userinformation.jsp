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
<title>Personal_Information</title>
<%
	//装载MySQL5.5的JDBC驱动
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	//建立数据库连接
	String url ="jdbc:mysql://127.0.0.1:3306/sql_project?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
	Connection conn= DriverManager.getConnection(url);
	//建立一个Statement对象，用于执行SQL语句
	Statement stat = conn.createStatement();
	//执行查询并得到查询结果	
	String customer_id =(String) session.getAttribute("e_mail"); 

	
	
  %> 
</head>
<body>
<script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>

    <div id="main_top">
        <nav>
            <div class="container">
				<div class="nav-wrapper">
                    <a href="#" class="brand-logo">INternational</a>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><a href="#">Welcome!   <%= customer_id%></a></li>
                    </ul>
                </div>
            </div>
            </div>
        </nav>
    </div>
   
   
    
	<div class = "information" style="margin-top: 50px;">
		<h2 align ="center">WELCOME to INternational!
		<h1 align ="center">Please fill the data below, and we can  help you find friends and activities better!
	</div>
    
    <div class = complete" style="margin-top: 50px;">
    	<div class = "container">
		    <div class="row">
		    <form align = "center" class="col s12" action="logging_data.jsp">
		    	    
		        <div class="input-field col s12">
		        	<i class="material-icons prefix">account_circle</i>
		        	<input name="customer_id" type="text" class="validate" disable value=<%= customer_id %>>
		        	<label for="customer_id">customer_id</label>
		        </div>
		        
		        
		        <div class="input-field col s12">
		        	<i class="material-icons prefix">account_circle</i>
		        	<input name="name" type="text" class="validate">
		        	<label for="name">Name</label>
		        </div>
		        
		        <div class="input-field col s5">
		        	<i class="material-icons prefix">question_answer</i>
		        	<input name="wechat" type="text" class="validate">
		        	<label for="wechat">WeChat</label>    
		        </div>
		        
		        <div class="input-field col s7">
		        	<i class="material-icons prefix">phone</i>
		        	<input name="telephone" type="tel" class="validate">
		        	<label for="telephone">Telephone</label>    
		        </div>
		        
		        <div class="input-field col s4">
		        	<i class="material-icons prefix">perm_identity</i>
		        	<input name="gender" type="text" class="validate">
		        	<label for="gender">Gender</label>    
		        </div>
		        
		        <div class="input-field col s8">
		        	<i class="material-icons prefix">today</i>
		        	<input name="date_of_birth" type="text" class="validate">
		        	<label for="date_of_birth">Date_of_Birth</label>    
		        </div>
		        
		        <div class="input-field col s12">
		        	<i class="material-icons prefix">language</i>
		        	<input name="nationality" type="text" class="validate">
		        	<label for="nationality">Nationality</label>    
		        </div>
		        
		        <div class="input-field col s6">
		        	<i class="material-icons prefix">business</i>
		        	<input name="school" type="text" class="validate">
		        	<label for="school">School</label>    
		        </div>
		        
		        <div class="input-field col s6">
		        	<i class="material-icons prefix">work</i>
		        	<input name="major" type="text" class="validate">
		        	<label for="major">Major</label>    
		        </div> 
		        
		        <div class="input-field col s12">
		        	<i class="material-icons prefix">thumb_up</i>
		        	<input name="self_intro" type="text" class="validate">
		        	<label for="self_intro">Self_Intro</label>    
		        </div>
		        
				<script>
					$(document).ready(function() {
						$('select').material_select();
					});
				</script>

		        <div class="input-field col s12">
					<select name ="language" multiple>
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
				
				
  			
				<button class="btn waves-effect waves-light" type="submit" name="action">Submit
    				<i class="material-icons right">send</i>
  				</button>
		        	        
			</form>
		    </div>
		</div>
	</div>
    
    
</body>
</html>