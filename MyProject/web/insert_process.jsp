<%-- 
    Document   : insert_process
    Created on : 10 Nov, 2018, 1:23:35 PM
    Author     : Milan
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String U_id=request.getParameter("ID");
String U_name=request.getParameter("name");
String U_marks=request.getParameter("marks");
String c1=request.getParameter("c1");
String c2=request.getParameter("c2");
String c3=request.getParameter("c3");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into marks(ID,name,marks,test_marks)values('"+U_id+"','"+U_name+"','"+U_marks+"','"+"0"+"')");
st.executeUpdate("insert into courses(ID,course,course1,course2)values('"+U_id+"','"+c1+"','"+c2+"','"+c3+"')");

out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>