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
public class GardeningTot extends HttpServlet {
    
    private HttpSession session = null;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            response.setContentType("text/html;charset=UTF-8");
            session = request.getSession(false);
            
            if(session != null){
                
                String footage = request.getParameter("footage");

                DAO dao = new DAO("Plandi","Card@4817","service_me");
                String total = ""+dao.calcTotGarden(footage);
                session.setAttribute("total", total);

                PrintWriter out = response.getWriter();
                out.print(""+total);
                dao.getCon().close();
            
            }
            else{
                
                String footage = request.getParameter("footage");
                
                DAO dao = new DAO("Plandi","Card@4817","service_me");
                String total =""+dao.calcTotGarden(footage);
                PrintWriter out = response.getWriter();
                out.print(""+total);
                dao.getCon().close();
                
               // response.sendRedirect("SignUpPage.html");
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    }

}
