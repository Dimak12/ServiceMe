/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceMe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
       
            try {
                DAO dao = new DAO("Plandi","Card@4817","service_me");
                feedback = dao.logInCheck(email, password);
                
                if(feedback == "exists"){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("email", email);
                    response.sendRedirect("LoggedHomePage.jsp");
                }
                
                else if(feedback == "notFound"){
                    
                    response.sendRedirect("NotsuccessfulPage.html");
                }
                
                dao.getCon().close();
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        
        
        
    }

    
}
