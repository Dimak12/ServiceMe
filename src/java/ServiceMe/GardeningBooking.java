/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceMe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PLANDI
 */
public class GardeningBooking extends HttpServlet {
    
    private String feedback;
   
    private HttpSession session = null;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        session = request.getSession(false);
        
        
        if(session != null){
            
            String agent = session.getAttribute("agent").toString();
            String customer = session.getAttribute("email").toString();
            
            String footage = session.getAttribute("footage").toString();
            String date = session.getAttribute("date").toString();
            String time = session.getAttribute("time").toString();
            String apt = session.getAttribute("apt").toString();
            String street = session.getAttribute("street").toString();
            String suburb = session.getAttribute("suburb").toString();
            Double total = Double.parseDouble(session.getAttribute("total").toString());
            
            Long card = Long.parseLong(request.getParameter("card"));
            int cvv = Integer.parseInt(request.getParameter("cvv"));
            String country = request.getParameter("country");
            String expiry = request.getParameter("expiry");
            String type = request.getParameter("pay");
        
        
            
            try {
                DAO dao = new DAO("Plandi","Card@4817","service_me");
                
                
                feedback = dao.bankingCheck(card);
            
                if(feedback == "exists"){
                    
                    feedback = dao.gardening_booking(customer, agent, footage, date, time, apt, street, suburb, total);
                
                    if(feedback == "success"){

                        response.sendRedirect("PaymentSuccess.html");
                    }


                    else if(feedback == "failed"){

                        response.sendRedirect("NotsuccessfulPage.html");
                    }

                }

                else if(feedback == "notFound"){

                    dao.bankingAdd(customer, card, cvv, country, expiry, type);
                    feedback = dao.gardening_booking(customer, agent, footage, date, time, apt, street, suburb, total);
                
                    if(feedback == "success"){

                        response.sendRedirect("PaymentSuccess.html");
                    }


                    else if(feedback == "failed"){

                        response.sendRedirect("UnsuccessfulPayment.html");
                    }


                    }
                
                dao.getCon().close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            
            
        }
        
        else{
            
            response.sendRedirect("SignUpPage.html");
        }
        
    }

   

}
