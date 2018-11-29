<%-- 
    Document   : insert_process
    Created on : 10 Nov, 2018, 1:23:35 PM
    Author     : Milan
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name1=request.getParameter("usrname");
String fname1=request.getParameter("fname");
String mname1=request.getParameter("mname");
String dob1=request.getParameter("dob");
String email1=request.getParameter("email");


try
{
Class.forName("com.mysql.jdbc.Driver");
   HttpSession ss=request.getSession();  
       
       String s_id1=(String)session.getAttribute("s_id");  
        

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();          
     
st.executeUpdate("insert into biodata(name,fname,mname,dob,email,ID)values('"+"name1"+"','"+"fname1"+"','"+"mname1"+"',"
        + "'"+"dob1"+"','"+"email1"+"','"+s_id1+"')");
out.println("Data is successfully inserted!"+request.getParameter("usrname"));
}
catch(Exception e)
{
out.println("Data is exc inserted!"+request.getParameter("usrname"));
}
%>