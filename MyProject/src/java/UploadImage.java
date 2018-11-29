import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author Milan
 */
@WebServlet("/UploadImage")
@MultipartConfig(maxFileSize= 16177216)
public class UploadImage extends HttpServlet {

  PrintWriter out;
  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String connectionURL="jdbc:mysql://localhost:3306/test";
        String user="root";
        String pass="";
        
    out=response.getWriter();
    int result=0;
    Connection con=null;
        
    Part part=request.getPart("image");
    String s_id1="";
    
    HttpSession session=request.getSession();  
        {  
        s_id1=(String)session.getAttribute("s_id");  
        }
    if(part!=null)
    {
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection(connectionURL,user,pass);
    PreparedStatement ps=con.prepareStatement("insert into imagetable(image,ID) values(?,?)");
    InputStream is=part.getInputStream();
    
    ps.setBlob(1,is);
    ps.setString(2,s_id1);
    
    result=ps.executeUpdate();
    if(result>0)
        out.println("OK");
    
    }
    catch(Exception e)
    {
    out.println(e);
    }
    }
        }
    }
