<meta charset="utf-8">
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- word type -->
<link rel="stylesheet" type="text/css" href="css/materialize.min.css"  media="screen,projection"/>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<%@ page import="java.sql.*"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Search</title>
<%
	//装载MySQL5.5的JDBC驱动
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	//建立数据库连接
	String url ="jdbc:mysql://127.0.0.1:3306/sql_project?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
	Connection conn= DriverManager.getConnection(url);

	String customer_id = request.getParameter("customer_id");
	String customer_name = new String();
	
	String sql ="select * from customer where customer_id = ?";
 	PreparedStatement stmt=conn.prepareStatement(sql);
 	stmt.setString(1,customer_id);
 	
	ResultSet rs = stmt.executeQuery();	
	while(rs.next()){		
	customer_name = rs.getString("customer_name").trim();
	}
	%>
	

<body>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>


    <nav class="light-blue">
        <div id="main_top">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo">INternational</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="to_mine_page.jsp?customer_id=<%=customer_id%>">Welcome! <%=customer_name%></a></li>
                    <li><a href="search.jsp?customer_id=<%=customer_id%>"><i class="material-icons">search</i></a></li>
                    </script>
                    <li><a href="index.html" ><i class="material-icons">power_settings_new</i></a></li>
                </ul>
            </div>
        </div>
    </nav>

        <div class="col s12" style="padding: 0;margin: 0;">
            <ul class="tabs">
                <li id="search_page_friends_active" class="tab col s6"><a href="#test1">好友</a></li>
                <li id="search_page_activities_active" class="tab col s6"><a href="#test2">活动</a></li>
            </ul>
        </div>
    </div>

    <!--搜索: 好友 id: search_page_friends -->
    <div id="search_page_friends" class="container"">
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
                        <div class="card-panel blue lighten-5">

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
                        <div class="card-panel blue lighten-5">

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
                <!--卡片内容居中测试-->

            </div>
        </div>
    </div>
    </div>
    <!--搜索: 好友 END-->

    <!--搜索: 活动 id: search_page_activities -->
    <div id="search_page_activities" class="container" style="display: none;">
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
                            <div class="card-panel blue lighten-5">

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
                            <div class="card-panel blue lighten-5">

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



<script>
    var spfa = document.getElementById('search_page_friends_active');
    var spf = document.getElementById('search_page_friends');
    var spaa = document.getElementById('search_page_activities_active');
    var spa = document.getElementById('search_page_activities')

    spfa.onclick = function () {
        spf.style.display = 'block';
        spa.style.display = 'none';
    }

    spaa.onclick = function () {
        spa.style.display = 'block';
        spf.style.display = 'none';
    }

</script>





</body>
</html>