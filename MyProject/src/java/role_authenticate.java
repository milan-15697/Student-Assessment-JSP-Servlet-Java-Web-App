import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

 
public class role_authenticate extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
    String user_name=request.getParameter("name");  
    String user_pass=request.getParameter("pass");  
    String s1="";
    String s2="";   
    String s3="";    
            Class.forName("com.mysql.jdbc.Driver");
            Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root" ,"");
            Statement  st =   con.createStatement();
              ResultSet rs =  st.executeQuery("Select * from roles");
              int flag=0;
              while(rs.next())
              {          
                  s1=rs.getString("name");               
                  s2=rs.getString("pass");
                  s3=rs.getString("role");

      if(user_name.equals(s1)&&user_pass.equals(s2)&&s3.equals("admin"))
                  {
                     out.print("Welcome "+ s3+"\n"); flag=1;
                     break;
                  }
     else if(user_name.equals(s1) && user_pass.equals(s2) && s3.equals("teacher"))
                  {
                     out.print("Welcome "+ s3+"\n"); flag=1;
                     break;
                  }
     
      else if(user_name.equals(s1) && user_pass.equals(s2) && s3.equals("student"))
                  {
                     out.print("Welcome "+ s3+"\n"); flag=1;
                     break;
                  }

              }
               if (flag==0)
              { 
                  response.sendRedirect("indexerror.html");
              }
        } catch (Exception e) {
            out.println("Not found" +e);
        }
        finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

