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

   
    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HCleaning</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HCleaning at " + request.getContextPath() + "</h1>");
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
        
        String svc = "cleaner";
        String bedrooms = request.getParameter("bedrooms");
        String bathrooms = request.getParameter("bathrooms");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String apt = request.getParameter("apt");
        String street = request.getParameter("street");
        String suburb = request.getParameter("location");
        
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

}