<%-- 
    Document   : recovery_ans_set
    Created on : 12 Nov, 2018, 7:28:00 PM
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
<a href="firstMain.jsp">
<img onmouseover="expand(this)" onmouseout="notexp(this)" src="images\amplifyworks-logo.svg" width="84"height="84"></a>

<font face="sans-serif"  size="12" color="#24CBF0">Your Bio: </font>
<%

String id="";
String new_pet=request.getParameter("f_pet");
String user_vno=request.getParameter("veh_reg");
try
{
Class.forName("com.mysql.jdbc.Driver");

//request.getRequestDispatcher("index.html").include(request, response);  
          
        HttpSession ss=request.getSession();  
        {  
        id=(String)session.getAttribute("s_id");  
        }

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();
st.executeUpdate("insert into pwd_recover(pass,pet_name,veh_reg_no)values('"+id+"','"+new_pet+"','"+user_vno+"')");
out.println("Security Questions are updated!");
}

catch(Exception e)
{
out.print("error"+e);

}
%>