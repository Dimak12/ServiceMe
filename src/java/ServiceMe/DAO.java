
package ServiceMe;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

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

    public String getFeedback() {
        return feedback;
    }

    public Connection getCon() {
        return con;
    }
    
    
    
    public String custAdd(String email, String fname, String contact, String password){
        
        String insert = "insert into customers(email,full_name,contact,password) values (?,?,?,?)";
        String query = "select * from customers where email= ?";
        int i = 0;
        try {
            
            PreparedStatement pstmnt = con.prepareStatement(query);
            pst = con.prepareStatement(insert);
            pstmnt.setString(1, email);
            pst.setString(1, email);
            pst.setString(2, fname);
            pst.setString(3,contact);
            pst.setString(4, password);
            rs = pstmnt.executeQuery();
            if(rs.next()){
                
                feedback = "taken";
            }
            
            else{
                
                i = pst.executeUpdate();
                
                if(i>0){
            
                    feedback = "success";
                }
        
                else {

                    feedback = "failed";
                }
            }
            
            
        } catch (SQLException ex) {
            ex.printStackTrace();
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
    
        public String providerAdd(String email, String fname, String password, String contact,Part image,String description,String services, String uploadPath){
        
        
        
        String insert = "insert into employees (email,full_name,password,contact,image,services,description) values(?,?,?,?,?,?,?)";
        String query = "select * from customers where email= ?";
        String path = null;
        int i = 0;
        try{
          
            File dir = new File(uploadPath);
            String fileName = image.getSubmittedFileName();   
             
            if (!dir.exists()) {
                dir.mkdirs();
            }
             
            
            if(fileName.isEmpty()){
                path = "https://i.ibb.co/ZVFsg37/default.png";
            }
            
            else{
                
                path = "images/"+fileName;
                InputStream is = image.getInputStream();
                Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
                
                
            }
            
            
            
            
            PreparedStatement pstmnt = con.prepareStatement(query);
            pst = con.prepareStatement(insert);
            
            
            pstmnt.setString(1, email);
            pst.setString(1, email);
            pst.setString(2,fname);
            pst.setString(3, password);
            pst.setString(4, contact);
            pst.setString(5, path);
            pst.setString(6, services);
            pst.setString(7, description);
            
            
            rs = pstmnt.executeQuery();
            
            if(rs.next()){
                
                feedback = "taken";
            }
            
            else{
                
                i = pst.executeUpdate();
                
                if(i>0){
            
                    feedback = "success";
                }
        
                else {

                    feedback = "failed";
                }
            }
            
        }catch (SQLException|IOException  ex) {
            ex.printStackTrace();
        }
        
            
        return feedback;
    }
        
        public ResultSet agentList(String svc){
            
            String query = "select * from employees where services = ?";
            
            
             try {
           
            pst = con.prepareStatement(query);
            pst.setString(1, svc);
            rs = pst.executeQuery();
            
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
            
            return rs;
            
        }
        
        public String booking(String customer, String agent, String bedrooms, String bathrooms, String date, String time, String apt, String street, String suburb, Double total){
            
                String insert = "insert into bookings(customer,agent,bedrooms,bathrooms,date,time,unit_and_apt,street,suburb,total) values(?,?,?,?,?,?,?,?,?,?)";
                int i = 0;
                
            try{
                pst = con.prepareStatement(insert); 
                pst.setString(1,customer);
                pst.setString(2,agent);
                pst.setInt(3, Integer.parseInt(bedrooms));
                pst.setInt(4, Integer.parseInt(bathrooms));
                pst.setString(5, date);
                pst.setString(6,time);
                pst.setString(7,apt);
                pst.setString(8,street);
                pst.setString(9,suburb);
                pst.setDouble(10,total);
                
                i = pst.executeUpdate();
                
                if(i>0){
            
                    feedback = "success";
                }
        
                else {

                    feedback = "failed";
                }
            
            
            }catch (SQLException ex) {
                
                ex.printStackTrace();
        }
            
            
            return feedback;
        } 
        
        public String bankingCheck(Long card){
            
            String query = "select * from banking_details where card_number= ?";
            try{
                
                pst = con.prepareStatement(query);
                pst.setLong(1, card);
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
        
        public void bankingAdd(String customer, Long card, int cvv, String country, String expiry, String type){
            
           String insert = "insert into banking_details(customer_email,card_number,expiry,cvv,country,type) values(?,?,?,?,?,?)"; 
           
           try{
              pst = con.prepareStatement(insert);
              pst.setString(1, customer);
              pst.setLong(2, card);
              pst.setString(3, expiry);
              pst.setInt(4, cvv);
              pst.setString(5, country);
              pst.setString(6, type);
              pst.executeUpdate();
               
           }catch (SQLException ex) {
                
                ex.printStackTrace();
            }
            
        }
}
//STR_TO_DATE(?,\"%Y/%m/%d\")