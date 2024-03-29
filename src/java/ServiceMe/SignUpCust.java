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
public class SignUpCust extends HttpServlet {

    private String feedback = null;
    private HttpSession session = null;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String fname = request.getParameter("fname");
        String password = request.getParameter("password");      
        String email = request.getParameter("NewEmail");
        String contact = request.getParameter("Contact_number");
        String checkbox = request.getParameter("Sign_UpPro");
        
        if("checked".equals(checkbox)){
            
            session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("contact", contact);
            session.setAttribute("password", password);
            response.sendRedirect("ProviderDescription.html");
        }
        
        else if (checkbox == null){
            
            try {
                DAO dao = new DAO("Plandi","Card@4817","service_me");
                feedback = dao.custAdd(email, fname, contact, password);
                
                if(feedback == "success"){
                    
                    response.sendRedirect("SuccessfulSignUp.html");
                }
                
                else if(feedback == "taken"){
                    
                    response.sendRedirect("UnsuccessfulSignUp.html");
                }
                
                else if(feedback == "failed"){
                    
                    response.sendRedirect("NotsuccessfulPage.html");
                }
                
                dao.getCon().close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
       
    }

   
}
