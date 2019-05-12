<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calorie Lab - Track Your Calorie With Us!</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--Animation-->
    <script src="js/wow.min.js"></script>
    <link href="css/animate.css" rel='stylesheet' type='text/css'/>
    <script>
        new WOW().init();
    </script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>

    <script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
    <script src="js/tms-0.4.1.js"></script>
    <script src="js/function.js"></script>
    <script>
    	
    </script>
</head>
<body>
<!-- header-section-starts -->
<div class="header">
    <div class="container">
        <div class="top-header">
            <div class="logo">
                <a href="index.jsp"><img src="images/logo.png" class="img-responsive" alt=""/></a>
            </div>
            <div class="queries">
                <p>Struggling with your recipe? Feel Free to<span>Track your Calorie</span>with us!</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="menu-bar">
        <div class="container">
            <div class="top-menu">
                <ul>
                    <li class="active"><a href="#Home" class="scroll">Calculator</a></li>
                    |
                    <li><a href="Top10Low.jsp">Learn More</a></li>
                    |
                    <li><a href="contact.jsp">contact</a></li>
                    <div class="clearfix"></div>
                </ul>
            </div>
            <div class="login-section">
                <ul>
                <%
    			if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
				%>
                    <li><a href="login.html">Login</a></li>
                    |
                    <li><a href="register.html">Register</a></li>
                    |
                <%} else {
				%>	<li><a href="myRecords.jsp"><%=session.getAttribute("userid")%></a></li>
					|
					<li><a href="logout.jsp">Logout</a></li>
				<%}%>
                    <div class="clearfix"></div>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="banner wow fadeInUp" data-wow-delay="0.4s" id="Home">
        <div class="container">
            <div class="banner-info">
                <div class="banner-info-head text-center wow fadeInLeft" data-wow-delay="0.5s">
                    <h1>Diet cures more than doctors</h1>
                    <div class="line">
                        <h2> Trace your calorie</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- header-section-ends -->
<!-- content-section-starts -->
<div class="order-section-page">
    <div class="ordering-form">
        <div class="container">
            <div class="order-form-head text-center wow bounceInLeft" data-wow-delay="0.4s">
                <h3>Calorie Calculator</h3>
                <p>Know your intake now!</p>
            </div>
            <div class="col-md-6 order-form-grids">
                <div class="order-form-grid  wow fadeInLeft" data-wow-delay="0.4s">
                    <h5>My menu</h5>
                    <span class="col-md-4">Category</span>
                    <span class="col-md-4">Food</span>
                    <span class="col-md-2">Quantity</span>
                    <span class="col-md-2">Unit</span>
                    <%
                    Connection con = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://us-cdbr-sl-dfw-01.cleardb.net/ibmx_b3956471090c404", "b0f02312588288", "8b790e01");
   					Statement st = con.createStatement();
    				ResultSet rs;
    				rs = st.executeQuery("select * from category");
					%>
                    <div>
                        <div class="col-md-4 wow">
                            <select class="dropdown" name="category" onchange="showFood(this.value)">
                                <option selected disabled>Select Category</option>
                                <%
								while(rs.next())
								{
								%>
								<option value="<%=rs.getString(1) %>" ><%=rs.getString(2) %></option>
								<%
								}
								%>
                            </select>
                        </div>
                        <div class="col-md-4 wow">
                        <div id="food">
                            <select id="foodUnit1" class="dropdown" tabindex="9" name="food" onchange="showUnit1();" disabled>
                                <option selected disabled>Select Food</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="input1" class="text" value=""/>
                        </div>
                        <div class="col-md-2" style="margin: 1em 0; font-size: 16px;">
                            <p id="unitFood1">--</p>
                        </div>
                    </div>
                    <div>
                        <div class="col-md-4 wow">
                            <select class="dropdown" name="category" onchange="showFood2(this.value)">
                                <option selected disabled>Select Category</option>
                                <%
                                rs.beforeFirst();
								while(rs.next())
								{
								%>
								<option value="<%=rs.getString(1) %>" ><%=rs.getString(2) %></option>
								<%
								}
								%>
                            </select>
                        </div>
                        <div class="col-md-4 wow">
                        <div id="food2">
                            <select id="foodUnit2" class="dropdown" tabindex="9" name="food" onchange="showUnit2();" disabled>
                                <option selected disabled>Select Food</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="input2" class="text" value=""/>
                        </div>
                        <div class="col-md-2" style="margin: 1em 0; font-size: 16px;">
                            <p id="unitFood2">--</p>
                        </div>
                    </div>
                    <div>
                        <div class="col-md-4 wow">
                            <select class="dropdown" name="category" onchange="showFood3(this.value)">
                                <option selected disabled>Select Category</option>
                                <%
                                rs.beforeFirst();
								while(rs.next())
								{
								%>
								<option value="<%=rs.getString(1) %>" ><%=rs.getString(2) %></option>
								<%
								}
								%>
                            </select>
                        </div>
                        <div class="col-md-4 wow">
                        <div id="food3">
                            <select id="foodUnit3" class="dropdown" tabindex="9" name="food" onchange="showUnit3();" disabled>
                                <option selected disabled>Select Food</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="input3" class="text" value=""/>
                        </div>
                        <div class="col-md-2" style="margin: 1em 0; font-size: 16px;">
                            <p id="unitFood3">--</p>
                        </div>
                    </div>
                    <div>
                        <div class="col-md-4 wow">
                            <select class="dropdown" name="category" onchange="showFood4(this.value)">
                                <option selected disabled>Select Category</option>
                                <%
                                rs.beforeFirst();
								while(rs.next())
								{
								%>
								<option value="<%=rs.getString(1) %>" ><%=rs.getString(2) %></option>
								<%
								}
								%>
                            </select>
                        </div>
                        <div class="col-md-4 wow">
                        <div id="food4">
                            <select id="foodUnit4" class="dropdown" tabindex="9" name="food" onchange="showUnit4();" disabled>
                                <option selected disabled>Select Food</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="input4" class="text" value=""/>
                        </div>
                        <div class="col-md-2" style="margin: 1em 0; font-size: 16px;">
                            <p id="unitFood4">--</p>
                        </div>
                    </div>
                    <div>
                        <div class="col-md-4 wow">
                            <select class="dropdown" name="category" onchange="showFood5(this.value)">
                                <option selected disabled>Select Category</option>
                                <%
                                rs.beforeFirst();
								while(rs.next())
								{
								%>
								<option value="<%=rs.getString(1) %>" ><%=rs.getString(2) %></option>
								<%
								}
								%>
                            </select>
                        </div>
                        <div class="col-md-4 wow">
                        <div id="food5">
                            <select id="foodUnit5" class="dropdown" tabindex="9" name="food" onchange="showUnit5();" disabled>
                                <option selected disabled>Select Food</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="input5" class="text" value=""/>
                        </div>
                        <div class="col-md-2" style="margin: 1em 0; font-size: 16px;">
                            <p id="unitFood5">--</p>
                        </div>
                    </div>
                    <div>
                        <div class="col-md-4 wow">
                            <select class="dropdown" name="category" onchange="showFood6(this.value)">
                                <option selected disabled>Select Category</option>
                                <%
                                rs.beforeFirst();
								while(rs.next())
								{
								%>
								<option value="<%=rs.getString(1) %>" ><%=rs.getString(2) %></option>
								<%
								}
								%>
                            </select>
                        </div>
                        <div class="col-md-4 wow">
                        <div id="food6">
                            <select id="foodUnit6" class="dropdown" tabindex="9" name="food" onchange="showUnit6();" disabled>
                                <option selected disabled>Select Food</option>
                            </select>
                        </div>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="input6" class="text" value=""/>
                        </div>
                        <div class="col-md-2" style="margin: 1em 0; font-size: 16px;">
                            <p id="unitFood6">--</p>
                        </div>
                    </div>
                    <div class="wow swing2 animated" data-wow-delay="0.4s">
                        <input type="button" value="Calculate" onclick="calculate()">
                    </div>
                </div>
            </div>
            <div class="col-md-6 order-form-grids wow bounceIn" data-wow-delay="0.4s">
                <div id="results" class="order-form-grid  wow fadeInRight" data-wow-delay="0.4s">
                    <div class="row">
    				<h2>Most Calorie Burning Ways</h2>
    
    				<small>Activities with calorie burn count per minute</small>
    
    				<hr>

    				<div class="col-md-4 col-md-push-4">
      					<div class="alert alert-danger">5.4 to 5.8 Calories</div>
      					<img class="img-responsive img-circle" src="http://www.coachray.nz/wp-content/uploads/2017/08/Aug-19.jpg" alt="Swimming">
    				</div>

    				<div class="col-md-4 col-md-pull-4 ">
      				<div class="alert alert-info">2.9 to 3.5 Calories</div>
      					<img class="img-responsive img-circle" src="https://www.active.com/Assets/Running/620/What+is+Maximalist+Running+LPF.jpg" alt="Running">
    				</div>

    				<div class="col-md-4">
      					<div class="alert alert-success">4.9 to 5.8 Calories</div>
      					<img class="img-responsive img-circle" src="http://cdn.mos.bikeradar.imdserve.com/images/news/2017/05/25/canyon-endurance-al-60-06-1493210151001-r4uyy4e6rl1u-1493991204064-1141b06ihkp7d-1495783915049-z0ugfo3fbqjd-630-354.jpg" alt="Cycling">
    				</div>

  				</div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="alertMessage"></div>
<% 
st.close();
rs.close();
con.close(); %>
<!-- content-section-ends -->
<!-- footer-section-starts -->
<div class="footer">
    <div class="container">
        <p class="wow fadeInLeft" data-wow-delay="0.4s">Copyright &copy; 2017. All rights reserved.</p>
    </div>
</div>
<!-- footer-section-ends -->
</body>
</html>