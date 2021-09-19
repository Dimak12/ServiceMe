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
public class SignUpCust extends HttpServlet {

    private String feedback = null;
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
            
            out.print("Provider page coming very soon");
        }
        
        else if (checkbox == null){
            
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
        }
       
    }

   
}
