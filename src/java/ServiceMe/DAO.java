
package ServiceMe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
             
           }
           
       }catch(SQLException e){
          e.printStackTrace();
       }
       
       return total;
    }
}
