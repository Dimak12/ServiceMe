/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceMe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PLANDI
 */
public class TotalCalc extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession(false);
            String bedrooms = request.getParameter("bedrooms");
            String bathrooms = request.getParameter("bathrooms");
            
            DAO dao = new DAO("Plandi","Card@4817","service_me");
            String total = ""+dao.calculateTotal(bedrooms, bathrooms);
            session.setAttribute("total", total);
            
            PrintWriter out = response.getWriter();
            out.print(""+total);
            
            dao.getCon().close();
            
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
