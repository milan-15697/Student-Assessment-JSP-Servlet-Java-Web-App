import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Milan
 */
public class PasswordRecoverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
 try {
    String pet_name=request.getParameter("pet");  
    String reg_no=request.getParameter("pass");  
   
            Class.forName("com.mysql.jdbc.Driver");
            Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root" ,"");
            Statement  st =   con.createStatement();
            ResultSet rs =  st.executeQuery("Select * from pwd_recover");
              String s1="";
              String s2="";
              String pass1="";
              int flag=0;
              while(rs.next())
              {          
                  s1=rs.getString("pet_name");               
                  s2=rs.getString("veh_reg_no");
                  pass1=rs.getString("pass");

      if(pet_name.equals(s1)&&reg_no.equals(s2))
                  {
               
                 //   HttpSession session=request.getSession();  
                  //  session.setAttribute("s_id",user_pass);
                    response.sendRedirect("pwd_recover.html");
                   // out.println("Your password is:  " +pass1);
                    
                    flag=1;
                     break;
                  }
      

              }
              if(flag==0)
            out.println("No Record Found!!");
 }
 catch(Exception e)
 {
  out.println("Not Record found" +e);

 }}
}
