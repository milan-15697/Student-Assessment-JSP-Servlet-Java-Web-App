<%-- 
    Document   : insert_process
    Created on : 10 Nov, 2018, 1:23:35 PM
    Author     : Milan
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>

<body onload="startTime()" >

    
    <div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<button class="login100-form-btn">
								<a href="LogoutServlet"  >Logout</a>
							</button>
						</div>
</div>
    
    
<div align="right" id="txt"> </div>

<marquee scrollamount="10" style="border:#B9CC20 3px SOLID" onmouseover="this.stop();" onmouseout="this.start();" >Latest Announcements are being displayed here!!</marquee>



<p><img  src="images\clever-owl.png" width="77" height="77" align="right"></p>
<a href="extra_MAIN.html">
<img onmouseover="expand(this)" onmouseout="notexp(this)" src="images\amplifyworks-logo.svg" width="84"height="84"></a>

<font face="sans-serif"  size="12" color="#24CBF0">Your Bio: </font>
<%

String old_pass="";
String new_pass=request.getParameter("new_pass");
String user_name=request.getParameter("f_user");
try
{
Class.forName("com.mysql.jdbc.Driver");

//request.getRequestDispatcher("index.html").include(request, response);  
          
        HttpSession ss=request.getSession();  
        {  
        old_pass=(String)session.getAttribute("s_id");  
        }

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();
PreparedStatement ps = null;
String sql="update details set name=?,pass=? where pass="+old_pass;
ps = conn.prepareStatement(sql);
ps.setString(1,user_name);
ps.setString(2,new_pass);
ps.executeUpdate();

PreparedStatement ps1 = null;
String sql2="update pwd_recover set pass=? where pass="+old_pass;
ps1 = conn.prepareStatement(sql2);
ps1.setString(1,new_pass);
ps1.executeUpdate();

out.println("Data is updated!");
}

catch(Exception e)
{
out.print("error");

}
%>