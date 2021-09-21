
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
public class Booking extends HttpServlet {

   
    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Booking</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Booking at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }*/

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();        
        HttpSession session = request.getSession(false);
        
        String agent = request.getParameter("agent");
        String customer = session.getAttribute("email").toString();
        String bedrooms = session.getAttribute("bedrooms").toString();
        String bathrooms = session.getAttribute("bathrooms").toString();
        String date = session.getAttribute("date").toString();
        String time = session.getAttribute("time").toString();
        String apt = session.getAttribute("apt").toString();
        String street = session.getAttribute("street").toString();
        String suburb = session.getAttribute("suburb").toString();
        
        out.print(bedrooms+"   bedroom " + bathrooms+ "   bathroom  "+ date+" @ "+time+"   location: "+ apt+" "+street+" "+suburb+"    customer: "+customer+"   agent picked: "+ agent );
        
        
    }

   
}
