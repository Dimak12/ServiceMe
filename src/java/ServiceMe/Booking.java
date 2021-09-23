
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
public class Booking extends HttpServlet {

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
            String bedrooms = session.getAttribute("bedrooms").toString();
            String bathrooms = session.getAttribute("bathrooms").toString();
            String date = session.getAttribute("date").toString();
            String time = session.getAttribute("time").toString();
            String apt = session.getAttribute("apt").toString();
            String street = session.getAttribute("street").toString();
            String suburb = session.getAttribute("suburb").toString();
            Double total = Double.parseDouble(session.getAttribute("total").toString());
            
            Long card = Long.parseLong(request.getParameter("card"));
            int cvv = Integer.parseInt(request.getParameter("cvc"));
            String country = request.getParameter("country");
            String expiry = request.getParameter("expiry");
            String type = request.getParameter("pay");
        
        
            
            try {
                DAO dao = new DAO("Plandi","Card@4817","service_me");
                
                
                feedback = dao.bankingCheck(card);
            
                if(feedback == "exists"){
                    
                    feedback = dao.booking(customer, agent, bedrooms, bathrooms, date, time, apt, street, suburb, total);
                
                    if(feedback == "success"){

                        response.sendRedirect("PaymentSuccess.html");
                    }


                    else if(feedback == "failed"){

                        response.sendRedirect("NotsuccessfulPage.html");
                    }

                }

                else if(feedback == "notFound"){

                    dao.bankingAdd(customer, card, cvv, country, expiry, type);
                    feedback = dao.booking(customer, agent, bedrooms, bathrooms, date, time, apt, street, suburb, total);
                
                    if(feedback == "success"){

                        response.sendRedirect("PaymentSuccess.html");
                    }


                    else if(feedback == "failed"){

                        response.sendRedirect("NotsuccessfulPage.html");
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
