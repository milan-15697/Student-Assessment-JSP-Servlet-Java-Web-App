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
String U_id=request.getParameter("ID");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("delete from marks where ID="+request.getParameter("ID"));
out.println("Data is successfully deleted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
