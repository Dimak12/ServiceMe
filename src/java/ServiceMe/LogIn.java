/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceMe;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PLANDI
 */
public class LogIn extends HttpServlet {

   private String feedback = null;
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String password = request.getParameter("Newpassword");
        String checkbox = request.getParameter("LogInPro");
        
        if("checked".equals(checkbox)){
            
            out.print("provider view coming soon");
        }
        
        else if (checkbox == null){
            
            DAO dao = new DAO("Plandi","Card@4817","service_me");
            feedback = dao.logInCheck(email, password);
            
            if(feedback == "exists"){
                
                response.sendRedirect("index.html");
            }
            
            else if(feedback == "notFound"){
                
                response.sendRedirect("NotsuccessfulPage.html");
            }
            //out.print(email + "" + password);
        }
        
        
    }

    
}
