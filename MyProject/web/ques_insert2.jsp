<%-- 
    Document   : insert_process
    Created on : 15 Nov, 2018, 1:23:35 PM
    Author     : Milan
--%>
<html>
    <body>
<link rel="stylesheet" type="text/css" href="css.css" media="screen" />
<p><img src="images\clever-owl.png" width="110"height="110" align="right"></p>

<body background="images\bg-6-full.jpg">
<a href="temp.html">
<img src="images\amplifyworks-logo.svg" width="120"height="120"></a>

<font face="verdana"  size="12" color="#24CBF0">Create </font>
<font face="verdana"  size="8" color="#1EBD39">Test!</font>

<object width="1340" height="50" data="images\twineblue.png"></object>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String q_no1=request.getParameter("q_no");
String quest1=request.getParameter("quest");
String opA1=request.getParameter("opA");
String opB1=request.getParameter("opB");
String opC1=request.getParameter("opC");
String que_ans1=request.getParameter("que_ans");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();

String query = "insert into questions(qno,quest,que_ans,opA,opB,opC)"+"values (?,?,?,?,?,?)";

      PreparedStatement ps = conn.prepareStatement(query);
      ps.setString (1, q_no1);
      ps.setString (2, quest1);
      ps.setString (3, que_ans1);
      ps.setString (4, opA1);
      ps.setString (5, opB1);
      ps.setString (6, opC1);
      ps.execute();




out.println("Question is successfully inserted!");
}
catch(Exception e)
{
out.println("error"+e);
e.printStackTrace();
}
%>

</body>
</html>
