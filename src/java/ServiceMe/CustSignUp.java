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
public class CustSignUp extends HttpServlet {

   
   
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
            
            out.print("Provider page coming soon");
        }
        
        else if("null".equals(checkbox)){
            
            out.print("welcome to login");
        }
    }

}
