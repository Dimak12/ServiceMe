/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceMe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import com.sun.xml.internal.bind.CycleRecoverable.Context;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author PLANDI
 */
@MultipartConfig(maxFileSize =161772216 ) 
public class SignUpAgent extends HttpServlet {
    
    private String feedback = null;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            String folderName = "images";
            String uploadPath = request.getServletContext().getRealPath("") + folderName;
            
            HttpSession session = request.getSession(false);
            String email = session.getAttribute("email").toString();
            String contact = session.getAttribute("contact").toString();
            String password = session.getAttribute("password").toString();
            String fname = request.getParameter("fname");
            Part image = request.getPart("img_one");
            String services = request.getParameter("Services");
            String description = request.getParameter("description");
            DAO dao = new DAO("Plandi","Card@4817","service_me");
            feedback = dao.providerAdd(email, fname, password, contact, image, description,services,uploadPath);
            
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
