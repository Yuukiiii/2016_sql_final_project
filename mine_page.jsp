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

	String customer_id = (String)session.getAttribute("customer_id");
	
	String sql ="select * from customer where customer_id = ?";
 	PreparedStatement stmt=conn.prepareStatement(sql);
 	stmt.setString(1,customer_id);
	ResultSet rs = stmt.executeQuery();	
	
	String customer_name=new String(),gender=new String(),date_of_birth=new String(),nationality=new String(),self_intro=new String(),wechat=new String(),
			telephone=new String(),school=new String(),major=new String();
	while(rs.next()){
		customer_name = rs.getString("customer_name").trim();
		gender = rs.getString("gender").trim();
		date_of_birth = rs.getString("date_of_birth").trim();
		nationality = rs.getString("nationality").trim();
		self_intro = rs.getString("self_intro").trim();
		wechat = rs.getString("wechat").trim();
		telephone = rs.getString("telephone").trim();
		school = rs.getString("school").trim();
		major = rs.getString("major").trim();
		
	}
	
/*  */




	int language_name_length=0;
	String sql2="select language_name from language natural join customer_language where customer_language.customer_id =? ";
 	PreparedStatement stmt2=conn.prepareStatement(sql2);
 	stmt2.setString(1,customer_id);
	ResultSet rs2 = stmt2.executeQuery();	 
	while(rs2.next()){
		language_name_length ++;
	}
	PreparedStatement stmt3=conn.prepareStatement(sql2); 
 	stmt3.setString(1,customer_id);
	ResultSet rs3 = stmt3.executeQuery();	 

	String[] language_name = new String[language_name_length];
	for(int i =0;rs3.next();i++){
		language_name[i]=rs3.getString("language_name").trim();
	}
	
	/*  */
	
	int friend_length=0;
		String sql3="select customer_name,gender,wechat,nationality from customer,friend where friend.customer_id=? and friend.friend_id=customer.customer_id";

		PreparedStatement stmt4=conn.prepareStatement(sql3);

	 	stmt4.setString(1,customer_id);

		ResultSet rs4 = stmt4.executeQuery();	 
		while(rs4.next()){
			friend_length ++;
		}

		PreparedStatement stmt5=conn.prepareStatement(sql3); 

		stmt5.setString(1,customer_id);

		ResultSet rs5 = stmt5.executeQuery();	

		String[] friend_name = new String[friend_length];
		String[] friend_gender = new String[friend_length];
		String[] friend_wechat = new String[friend_length]; 
		String[] friend_nationality = new String[friend_length];

		for(int i =0;rs5.next();i++){

			friend_name[i] = rs5.getString("customer.customer_name").trim();
			friend_gender[i]=rs5.getString("gender").trim();
			friend_wechat[i]=rs5.getString("wechat").trim();
			friend_nationality[i]=rs5.getString("nationality").trim();
		
		}
		
		
		/*  */
		
		int activity_length =0;

		String sql4="select * from customer_activity,activity where customer_activity.customer_id=? and activity.activity_id=customer_activity.activity_id";

		PreparedStatement stmt6=conn.prepareStatement(sql4); 

		stmt6.setString(1,customer_id);

		ResultSet rs6 = stmt6.executeQuery();	 

		while(rs6.next()){
			activity_length ++;
		}
		PreparedStatement stmt7=conn.prepareStatement(sql4); 

		stmt7.setString(1,customer_id);

		ResultSet rs7 = stmt7.executeQuery();	

		String[] activity_id = new String[activity_length];
		String[] activity_name = new String[activity_length];
		String[] activity_time = new String[activity_length];
		String[] activity_address = new String[activity_length]; 
		String[] activity_intro = new String[activity_length];

		for(int i =0;rs7.next();i++){

			activity_id[i] = rs7.getString("activity_id").trim();
			activity_name[i] = rs7.getString("activity_name").trim();
			activity_time[i]=rs7.getString("activity_time").trim();
			activity_address[i]=rs7.getString("activity_address").trim();
			activity_intro[i]=rs7.getString("activity_introduction").trim();
		}
		
		/*  */
		String sql5="";
		String[] activity_language = new String[activity_length];
		int activity_language_length=0;
	 	PreparedStatement stmt8;
		ResultSet rs8;
		for(int i =0 ; i<activity_length; i++){
			activity_language[i]="";
			sql5="select language_name from language natural join activity_language where activity_language.activity_id =? ";
		 	stmt8=conn.prepareStatement(sql5);
		 	stmt8.setString(1,activity_id[i]);
			rs8 = stmt8.executeQuery();	 
			while(rs8.next()){
				activity_language[i]+=rs8.getString("language_name").trim()+" ";
			}
		}
  %> 
<body class="grey lighten-3">
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>

    <nav class="light-blue">
        <div id="main_top">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo" style="margin-left: 20px;">INternational</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="to_usermain.jsp?customer_id=<%=customer_id%>">Welcome! <%=customer_name%></a></li>
                    <li><a href="search.jsp"><i class="material-icons">search</i></a></li>
                    <li><a href="myself.jsp?customer_id=<%= customer_id%>"><i class="material-icons">perm_identity</i></a></li>
                    <li><a href="my_activity"><i class="material-icons">view_module</i></a></li>
                    <script type="text/javascript">
                        function logout(){
                        <%
                            session.invalidate(); //运用invalidate()比较好，退出时使session失效
                        %>
                        }
                    </script>
                    <li><a href="index.html" onclick="logout()"><i class="material-icons">power_settings_new</i></a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="row">
        <div class="col s12" style="padding: 0;margin: 0;margin-top: -10px;">
            <ul class="tabs">
                <li id="mine_page_friends_active" class="tab col s6"><a href="#test1">我的好友</a></li>
                <li id="mine_page_activities_active" class="tab col s6"><a href="#test2">我的活动</a></li>
                <li id="mine_page_information_active" class="tab col s6"><a href="#test2">个人信息</a></li>
            </ul>
        </div>
    </div>

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
                                <select>
                                    <option value="" disabled selected>选择搜索条件</option>
                                    <option value="1">国籍</option>
                                    <option value="2">语言</option>
                                    <option value="3">宗教</option>
                                </select>
                            </div>

                            <form>
                                <div class="input-field col s9">
                                    <input id="search" type="search" required>
                                    <label for="search"><i class="material-icons">search</i></label>
                                    <i class="material-icons">close</i>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>
                <!--搜索栏END-->

                <!--结果卡片-->
                <div class="row">
                    <div class="col s12">
                        <div class="card-panel">

                            <div class="row valign-wrapper">
                                <div class="col s2">
                                    <img src="img/head.png" alt="" class="circle responsive-img">
                                </div>
                                <div class="col s10">
                                    <table class="responsive-table center">
                                        <thead>
                                        <tr>
                                            <th data-field="id">姓名</th>
                                            <th data-field="name">年龄</th>
                                            <th data-field="price">国籍</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <tr>
                                            <td>Sahrechiiz</td>
                                            <td>21</td>
                                            <td>中国</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--卡片e.g 1 END-->

                <div class="row">
                    <div class="col s12">
                        <div class="card-panel">

                            <div class="row valign-wrapper">
                                <div class="col s2">
                                    <img src="img/head.png" alt="" class="circle responsive-img">
                                </div>
                               <% for (int i = 0; i < friend_length; i++)
									          {
											              %>

                            <div class="row valign-wrapper">
                                <div class="col s2">
                                    <img src="img/head.png" alt="" class="circle responsive-img">
                                </div>
		                                <div class="col s10">
		                                    <table class="responsive-table center">
		                                      
											              
	                                        <thead>
	                                        <tr>
	                                            <th data-field="id">姓名</th>
	                                            <th data-field="name">性别</th>
	                                            <th data-field="price">国籍</th>
	                                            <th data-field="id">微信</th>
	                                        </tr>
	                                        </thead>
	                                        <tbody>
									         <tr>
									         <td><%=friend_name[i]%></td>
									         <td><%=friend_gender[i]%></td>
									         <td><%=friend_nationality[i]%></td>
									         <td><%=friend_wechat[i]%></td></tr>
									         </tbody>
		                                        
		                                    </table>
		                                </div>
		                            </div>
									    <% }
									         %>
                            </div>

                        </div>
                    </div>
                </div>
                <!--卡片内容居中测试-->

            </div>
        </div>
    </div>
    </div>


    <div id="mine_page_activities" class="container" style="display: none;">
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
                                    <select>
                                        <option value="" disabled selected>选择搜索条件</option>
                                        <option value="1">时间</option>
                                        <option value="2">地点</option>
                                        <option value="3">搞基</option>
                                        <option value="3">搞姬</option>
                                    </select>
                                </div>

                                <form>
                                    <div class="input-field col s9">
                                        <input id="search" type="search" required>
                                        <label for="search"><i class="material-icons">search</i></label>
                                        <i class="material-icons">close</i>
                                    </div>
                                </form>

                            </div>

                        </div>
                    </div>
                    <!--搜索栏END-->


                    <div class="row">
                        <div class="col s12">
                            <div class="card-panel">

                                <div class="row valign-wrapper">
                                    <div class="col s12">
                                        <table class="responsive-table center">
                                            <thead>
                                            <tr>
                                                <th>标题</th>
                                                <th>时间</th>
                                                <th>地点</th>
                                                <th>介绍</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <tr>
                                                <td>海天盛筵</td>
                                                <td>2016/06/09</td>
                                                <td>南海之上</td>
                                                <td>海天盛筵是在海南三亚举办的国际奢侈生活方式品牌文化交流展。
                                                    自2010年创办以来共举办4届，这场一年一度的盛会持续四天，主要包括游艇展、
                                                    公务机展、房产展以及多种奢侈精品时尚生活品牌展示。
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col s12">
                            <div class="card-panel">

                                <div class="row valign-wrapper">
                                    <div class="col s12">
                                        <table class="responsive-table center">
                                            <thead>
                                            <tr>
                                                <th>标题</th>
                                                <th>时间</th>
                                                <th>地点</th>
                                                <th>介绍</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <tr>
                                                <td>海天盛筵</td>
                                                <td>2016/06/09</td>
                                                <td>南海之上</td>
                                                <td>海天盛筵是在海南三亚举办的国际奢侈生活方式品牌文化交流展。
                                                    自2010年创办以来共举办4届，这场一年一度的盛会持续四天，主要包括游艇展、
                                                    公务机展、房产展以及多种奢侈精品时尚生活品牌展示。
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>




    <div id="mine_page_information" class="container" style="display: none;">
        <div class="row">
            <div class="col s12">
                <div class="card-panel">
                    <div class="row">
                        <div class="col s12">
                            <form align = "center" class="col s12" action="modify.jsp?customer_id=<%=customer_id%>" method="post">


                                <div class="input-field col s12">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input name="customer_id" type="text" class="validate" disabled value=<%= customer_id%>>
                                    <label for="customer_id">customer_id</label>
                                </div>


                                <div class="input-field col s12">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input name="name" type="text" class="validate" value = <%=customer_name%>>
                                    <label for="name">name</label>
                                </div>


                                <div class="input-field col s5">
                                    <i class="material-icons prefix">question_answer</i>
                                    <input name="wechat" type="text" class="validate" value=<%=wechat%>>
                                    <label for="wechat">wechat</label>
                                </div>

                                <div class="input-field col s7">
                                    <i class="material-icons prefix">phone</i>
                                    <input name="telephone" type="tel" class="validate" value=<%=telephone %>>
                                    <label for="telephone">telephone</label>
                                </div>

                                <div class="input-field col s4">
                                    <i class="material-icons prefix">perm_identity</i>
                                    <input name="gender" type="text" class="validate" value=<%= gender %>>
                                    <label for="gender">gender</label>
                                </div>

                                <div class="input-field col s8">
                                    <i class="material-icons prefix">today</i>
                                    <input name="date_of_birth" type="text" class="validate" value=<%=date_of_birth%>>
                                    <label for="date_of_birth">date_of_birth</label>
                                </div>

                                <div class="input-field col s12">
                                    <i class="material-icons prefix">language</i>
                                    <input name="nationality" type="text" class="validate" value=<%=nationality %>>
                                    <label for="nationality">nationality</label>
                                </div>

                                <div class="input-field col s6">
                                    <i class="material-icons prefix">business</i>
                                    <input name="school" type="text" class="validate" value=<%=school %>>
                                    <label for="school">school</label>
                                </div>

                                <div class="input-field col s6">
                                    <i class="material-icons prefix">work</i>
                                    <input name="major" type="text" class="validate" value=<%=major %>>
                                    <label for="major">major</label>
                                </div>

                                <div class="input-field col s12">
                                    <i class="material-icons prefix">thumb_up</i>
                                    <input name="self_intro" type="text" class="validate" value=<%=self_intro %>>
                                    <label for="self_intro">self_intro</label>
                                </div>

                                <script>
                                    $(document).ready(function() {
                                        $('select').material_select();
                                    });
                                </script>

                                <%
                                String full_language_name=new String();
                                int i;
                                for(i = 0;i<language_name.length-1;i++){
                                full_language_name+=language_name[i]+", ";
                                }
                                full_language_name+=language_name[i-1];
                                %>
                                <div class="input-field col s12">
                                    <select name ="language" multiple>
                                        <option value="" disabled selected><%= full_language_name %>
                                        </option>
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
                                <%	customer_id = request.getParameter("customer_id");

                                %>
                                <input class="btn waves-effect waves-light" type="submit" name="modify" value="submit">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
    var mpfa = document.getElementById('mine_page_friends_active');
    var mpf = document.getElementById('mine_page_friends');
    var mpaa = document.getElementById('mine_page_activities_active');
    var mpa = document.getElementById('mine_page_activities');
    var mpia = document.getElementById('mine_page_information_active');
    var mpi = document.getElementById('mine_page_information');

    mpfa.onclick = function () {
        mpf.style.display = 'block';
        mpa.style.display = 'none';
        mpi.style.display = 'none';
    }
    mpaa.onclick = function () {
        mpf.style.display = 'none';
        mpa.style.display = 'block';
        mpi.style.display = 'none';
    }
    mpia.onclick = function () {
        mpf.style.display = 'none';
        mpa.style.display = 'none';
        mpi.style.display = 'block';
    }

</script>

</body>
</html>