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
import javax.servlet.http.HttpSession;

/**
 *
 * @author PLANDI
 */
public class Banking extends HttpServlet {

    private HttpSession session = null;
    private String feedback = null;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        session = request.getSession(false);
        Long card = Long.parseLong(request.getParameter("card"));
        int cvv = Integer.parseInt(request.getParameter("cvc"));
        String country = request.getParameter("country");
        String expiry = request.getParameter("expiry");
        String type = request.getParameter("type");
        
        if(session != null){
            
            String customer = session.getAttribute("email").toString();
            
            DAO dao = new DAO("Plandi","Card@4817","service_me");
            Booking book = null;
            feedback = dao.bankingCheck(card);
            
            if(feedback == "exists"){
                
                
                book = new Booking();
               
                
                    
                }
                
            else if(feedback == "notFound"){
                
                dao.bankingAdd(customer, card, cvv, country, expiry, type);
                
                
                }
            
        }
        else{
            
            response.sendRedirect("SignUpPage.html");
        }
        
    }

    
}
