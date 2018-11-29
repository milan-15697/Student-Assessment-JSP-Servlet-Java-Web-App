<%-- 
    Document   : create_ques
    Created on : 16 Nov, 2018, 10:49:07 AM
    Author     : Milan
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" type="text/css" href="css.css" media="screen" />
<p><img src="images\clever-owl.png" width="110"height="110" align="right"></p>

<body background="images\bg-6-full.jpg">
<a href="firstMain.jsp">
<img src="images\amplifyworks-logo.svg" width="120"height="120"></a>

<font face="verdana"  size="12" color="#24CBF0">Take </font>
<font face="verdana"  size="8" color="#1EBD39">Test!</font>

<object width="1340" height="50" data="images\twineblue.png"></object>
<br>

</head>
<body>


<h2><b>Best Of Luck: <b></h2><br><br>
<form name="examForm" method="post" action="ExamServer.jsp">
    <%
        try{
       Class.forName("com.mysql.jdbc.Driver");
        
 String row_check= "SELECT COUNT(*) FROM questions";
 
String query="select * from questions";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(query); 

char f_name='a';
int temp=0;
while(rs.next())
{
    //  out.print(rs.getString("qno")+"."+rs.getString("quest"));<br>

   %>
   
   
Q.No:<%=rs.getString("qno") %> <%=rs.getString("quest") %><br><br>


<input type="checkbox"  value="<%=rs.getString("opA") %>" name=f_name><%=rs.getString("opA") %>
<input type="checkbox"  value="<%=rs.getString("opB") %>" name=f_name><%=rs.getString("opB") %>
<input type="checkbox"  value="<%=rs.getString("opC") %>" name=f_name> <%=rs.getString("opC") %>

<br/><br/>
<hr>

    <%
        
    temp=(int)f_name+1;
    f_name=(char)temp;
}
}
        catch(Exception e)
    {
  out.print("Caught: "+e);

}
%>
<input type="submit" value="Check Your Result"/>

</body>
</html>