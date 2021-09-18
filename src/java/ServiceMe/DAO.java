
package ServiceMe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PLANDI
 */
public class DAO {
    
    private Connection con;
    private PreparedStatement pst;
    private String feedback;
    private ResultSet rs;
    public DAO(String user,String password,String dbName){
        
        String url = "jdbc:mysql://localhost:3306/"+dbName;  
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection(url,user,password);
        } catch (SQLException|ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }
    
    public double calculateTotal(String bedrooms,String bathrooms){
        
        double living_kitchen;
        double bedPrice;
        double bathPrice;
        double total = 0;
       try{
           
           String query = "select * from prices" ;
           pst = con.prepareStatement(query);
           rs = pst.executeQuery();
           
           while(rs.next()){
               
               living_kitchen = rs.getDouble(1);
               bedPrice = rs.getDouble(2);
               bathPrice = rs.getDouble(3);
               total = living_kitchen + (Integer.parseInt(bedrooms)*bedPrice) + (Integer.parseInt(bathrooms)*bathPrice);
               
               con.close();
           }
           
       }catch(SQLException e){
          e.printStackTrace();
       }
       
       return total;
    }

    public String getFeedback() {
        return feedback;
    }
    
    
    
    public String custAdd(String email, String fname, String contact, String password){
        
        String insert = "insert into customers(email,full_name,contact,password) values (?,?,?,?)";
        int i = 0;
        try {
            pst = con.prepareStatement(insert);
            pst.setString(1, email);
            pst.setString(2, fname);
            pst.setString(3,contact);
            pst.setString(4, password);
            i = pst.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        if(i>0){
            
            feedback = "success";
        }
        
        else {
            
            feedback = "failed";
        }
        
        return getFeedback();
    }
    
    public String logInCheck(String email, String password){
        
        String query = "select * from customers where email= ? and password= ? ";
        try{
            
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            
            if(!rs.next()){
                
                feedback = "notFound";
            }
            
            else{
                feedback = "exists";
            }
        }catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return getFeedback();
    }
}
