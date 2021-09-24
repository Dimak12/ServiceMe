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
public class HCleaning extends HttpServlet {
    
    private HttpSession session = null;

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
        session = request.getSession(false);
        
        String svc = "cleaner";
        String bedrooms = request.getParameter("bedrooms");
        String bathrooms = request.getParameter("bathrooms");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String apt = request.getParameter("apt");
        String street = request.getParameter("street");
        String suburb = request.getParameter("location");
        
        if(session != null){
            
            session.setAttribute("bedrooms", bedrooms);
            session.setAttribute("bathrooms", bathrooms);
            session.setAttribute("date", date);
            session.setAttribute("time",time);
            session.setAttribute("apt", apt);
            session.setAttribute("street", street);
            session.setAttribute("suburb", suburb);
            session.setAttribute("svc", svc);

            response.sendRedirect("ListEmployee.jsp");
            
        }
        
        else{
            
            response.sendRedirect("SignUpPage.html");
        }
        
        
    }

}
