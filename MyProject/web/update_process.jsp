<%-- 
    Document   : insert_process
    Created on : 10 Nov, 2018, 1:23:35 PM
    Author     : Milan
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
    <body>
        
<a href="firstMain.jsp">
<img onmouseover="expand(this)" onmouseout="notexp(this)" src="images\amplifyworks-logo.svg" width="84"height="84"></a>
        <body background="images\bg-6-full.jpg">
    </body>
</html>
<%
String updated_name=request.getParameter("name");
String updated_marks=request.getParameter("marks");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
PreparedStatement ps = null;

String sql="update marks set id=?,name=?,marks=? where ID="+request.getParameter("ID");

ps = conn.prepareStatement(sql);
ps.setString(1,request.getParameter("ID"));
ps.setString(2,updated_name);
ps.setString(3,updated_marks);

ps.executeUpdate();
out.println("Data is successfully updated!"+"New marks of "+updated_name+" are "+updated_marks);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>