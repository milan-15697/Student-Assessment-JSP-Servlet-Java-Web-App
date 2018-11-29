<%-- 
    Document   : ExamServer
    Created on : 16 Nov, 2018, 10:35:20 AM
    Author     : Milan
--%>

<%@page contentType="text/html" language="java" import="java.sql.*"%>
<html>
<head>
<title>Online Exam Server</title>
<body background="images\bg-6-full.jpg">

<style type="text/css">
</style>
</head>
<body>
<h2 style="text-align:center">ONLINE EXAMINATION</h2>
<p>
<a href="firstMain.jsp">
<img onmouseover="expand(this)" onmouseout="notexp(this)" src="images\amplifyworks-logo.svg" width="84"height="84"></a>
</p>
<hr/>
<%
String str1=request.getParameter("f_name");
String str2=request.getParameter("f_name");
String str3=request.getParameter("f_name");
int mark=0;

String s_id1="";
 HttpSession ss=request.getSession();  
        {  
        s_id1=(String)session.getAttribute("s_id");  
        }

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM questions");
int i=1;
while(rs.next())
{
 if(i==1)
 {
  String dbans1=rs.getString("que_ans");
  if(str1.equals(dbans1))
  {
   mark=mark+5;
  }
 }
 
 if(i==2)
 {
  String dbans2=rs.getString("que_ans");
  if(str2.equals(dbans2))
  {
   mark=mark+5;
  }
 }
 if(i==3)
 {
  String dbans3=rs.getString("que_ans");
  if(str3.equals(dbans3))
  {
   mark=mark+5;
  }
 }
 
 i++;
}
if(mark>=10)
{
 
 out.println("<h3>Thank You For Taking The Test</h3>");
}
else
{
 out.println("Thank You For Taking The Test");
} 

PreparedStatement ps = null;

String sql="update marks set test_marks=? where ID="+s_id1;

ps = conn.prepareStatement(sql);
ps.setString(1,String.valueOf(mark));

ps.executeUpdate();
%>
</form>
</body>
</html>