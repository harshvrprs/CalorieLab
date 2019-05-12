<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Administrator Page</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--Animation-->
    <script src="js/wow.min.js"></script>
    <link href="css/animate.css" rel='stylesheet' type='text/css'/>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script>
        new WOW().init();
    </script>
    <script>
    $(document).ready(function(){
    	$("#mytable #checkall").click(function () {
    	        if ($("#mytable #checkall").is(':checked')) {
    	            $("#mytable input[type=checkbox]").each(function () {
    	                $(this).prop("checked", true);
    	            });

    	        } else {
    	            $("#mytable input[type=checkbox]").each(function () {
    	                $(this).prop("checked", false);
    	            });
    	        }
    	    });
    	    
    	    $("[data-toggle=tooltip]").tooltip();
    	});
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
                <p>Administrator Page</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="menu-bar">
        <div class="container">
            <div class="top-menu">
                <ul>
                    <li><a href="index.jsp" class="scroll">Calculator</a></li>
                    |
                    <li><a href="Top10Low.jsp">Top 10 Low</a></li>
                    |
                    <li><a href="Top10High.jsp">Top 10 High</a></li>
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
</div>
<!-- header-section-ends -->
<div class="container">
	<div class="row">
        <div class="col-md-12">
        <h4>Registered Users</h4>
        <div class="table-responsive">  
              <table id="mytable" class="table table-bordred table-striped">
                   <thead>
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>Name</th>
                   <th>Email</th>
                   <th>Send</th>
                   </thead>
        <%
          Connection con = null;
          Class.forName("com.mysql.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://us-cdbr-sl-dfw-01.cleardb.net/ibmx_b3956471090c404", "b0f02312588288", "8b790e01");
   			Statement st = con.createStatement();
    		ResultSet rs;
    		rs = st.executeQuery("select * from user");
		%>
    	<tbody>
    	<%
			while(rs.next())
			{
		%>
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(4) %></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><a href="sendSms.jsp"><span class="glyphicon glyphicon-pencil"></span></a></p></td>
    </tr>
    	<%
			}
		%>
    </tbody>
        
</table>
<% 
	st.close();
	rs.close();
	con.close(); 
%>
<div class="clearfix"></div>
            </div> 
        </div>
	</div>
</div>

<!-- footer-section-starts -->
<div class="footer">
    <div class="container">
        <p class="wow fadeInLeft" data-wow-delay="0.4s">Copyright &copy; 2017. All rights reserved.</p>
    </div>
</div>
<!-- footer-section-ends -->
</body>
</html>