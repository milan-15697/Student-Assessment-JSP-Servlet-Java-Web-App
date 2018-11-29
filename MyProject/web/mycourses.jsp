<%-- 
    Document   : mycourses
    Created on : 20 Nov, 2018, 2:52:18 PM
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
<html>

        <body background="images\bg-6-full.jpg">
   
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
<a href="firstMain.jsp">
<img onmouseover="expand(this)" onmouseout="notexp(this)" src="images\amplifyworks-logo.svg" width="84"height="84"></a>

<font face="sans-serif"  size="12" color="#24CBF0">My Courses </font>
<br><br>
<table border="2">
<tr>
<td>Course A:</td>
<td>Course B:</td>
<td>Course C:</td>

</tr>
<%

String s_id1="";
try
{
Class.forName("com.mysql.jdbc.Driver");

//request.getRequestDispatcher("index.html").include(request, response);  
          
        HttpSession ss=request.getSession();  
        {  
        s_id1=(String)session.getAttribute("s_id");  
        }
        
 String query="select * from courses where ID="+s_id1;
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(query);

while(rs.next())
{

%>

<tr><td><%=rs.getString("course") %></td>
    <td> <%=rs.getString("course1") %></td>
        <td> <%=rs.getString("course2") %></td>
         
</tr>


 <%
}

}
catch(Exception e)
{
System.out.print("No Data Available");

}
%>