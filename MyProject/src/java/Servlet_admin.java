import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

 
public class Servlet_admin extends HttpServlet {
        
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
        
        try {
    String s1=request.getParameter("sign_name");  
    String s2=request.getParameter("sign_pass");  
       
    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root" ,"");
            Statement  st =  con.createStatement();
            ResultSet rs =  st.executeQuery("Select * from details");

       out.print("Details Of Students Who Have Registered:"+"</br>");
            while(rs.next())
              {          
                  s1=rs.getString("name");               
                  s2=rs.getString("pass");
                  out.print(s1+" "+s2+"</br>");
              }
            
      con.close();       
        } catch (Exception e) {
            out.println("\nError\n" +e);
        }
        finally {
            out.close();
        }
    }
}
