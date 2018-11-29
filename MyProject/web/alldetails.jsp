<%-- 
    Document   : alldetails
    Created on : 10 Nov, 2018, 11:55:14 AM
    Author     : Milan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<body background="images\bg-6-full.jpg">
<script>
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =
   "Time:"+ h + "h:" + m + "m:" + s + "s";
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
function expand(x) {

x.style.width= "120px";
  x.style.height= "120px"; }
  
 function notexp(x) {

  x.style.width= "77px";
  x.style.height= "77px"; }
  
  function color (x) {
  style="background-color:PaleGreen"
    color:black;
  }
  
  function default1 (x) {
  
  style="background-color:PaleGreen"
}

</script>

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
<a href="temp.html">
<img onmouseover="expand(this)" onmouseout="notexp(this)" src="images\amplifyworks-logo.svg" width="84"height="84"></a>

<font face="sans-serif"  size="12" color="#24CBF0">Welcome </font>
<br><br>   Details of Registered Students with their marks(if any): </br></br>
 <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<p align="center">
<form method="post" align="center">

<table border="2">
<tr>
<td>ID</td>
<td>User Name</td>
<td>CGPA</td>

</tr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/test";
String username="root";
String password="";
String query="select * from marks";
Connection conn=DriverManager.getConnection(url, username, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
<tr><td><%=rs.getString("ID") %></td>
    <td><%=rs.getString("name") %></td>
<td><%=rs.getString("marks") %></td></tr>
 <%
}
%>
</table>
<%
rs.close();
stmt.close();
conn.close();
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</form>
<br><br>
Table Containing Bio-data of Students:
<br>
</p>
<form method="post" align="center">

<table border="2">
<tr>
<td>Student Name</td>
<td>Father's Name</td>
<td>Mother's Name</td>
<td>D.O.B</td>
<td>Student ID</td>

</tr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/test";
String username="root";
String password="";
String query="select * from biodata";
Connection conn=DriverManager.getConnection(url, username, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
<tr>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("fname") %></td>
<td><%=rs.getString("mname") %></td>
<td><%=rs.getString("dob") %></td>
<td><%=rs.getString("ID") %></td></tr>
 <%
}
%>
</table>
<%
rs.close();
stmt.close();
conn.close();
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</form>

</table>
    </body>
</html>
