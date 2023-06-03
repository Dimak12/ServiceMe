
package ServiceMe;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        
        
        double [] price = new double[3];
        double living_kitchen;
        double bedPrice;
        double bathPrice;
        double total = 0;
        int i = 0;
        
       try{
           
           String query = "select * from cleaning_prices";
           pst = con.prepareStatement(query);
           rs = pst.executeQuery();
           
           while(rs.next()){
               
               price [i] = rs.getDouble("price");
               i++;
               
           }
           
           living_kitchen = price[0];
           bedPrice = price[1];
           bathPrice = price[2];
           total = living_kitchen + (Integer.parseInt(bedrooms)*bedPrice) + (Integer.parseInt(bathrooms)*bathPrice);
           
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
        
        String insert = "insert into customers(customer_email,full_name,contact,password) values (?,?,?,?)";
        String query = "select * from customers where customer_email= ?";
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
        
        String query = "select * from customers where customer_email= ? and password= ? ";
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
        
        
        
        String insert = "insert into employees (agent_email,full_name,password,contact,image,services,description) values(?,?,?,?,?,?,?)";
        String query = "select * from employees where agent_email= ?";
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
            
                String insert = "insert into bookings(customer_email,agent_email,bedrooms,bathrooms,date,time,unit_and_apt,street,suburb,total) values(?,?,?,?,?,?,?,?,?,?)";
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
        
        public double calcTotGarden(String footage){
            
            double total = 0;
            
            try{
           
           String query = "select * from garden_prices where footage = ?" ;
           pst = con.prepareStatement(query);
           pst.setString(1, footage);
           rs = pst.executeQuery();
           
           while(rs.next()){
              
               total = rs.getDouble("price");
           }
           
       }catch(SQLException e){
          e.printStackTrace();
       }
            
            return total;  
               
           }
        
        public String gardening_booking(String customer, String agent, String footage, String date, String time, String apt, String street, String suburb, Double total) {
            
            
                String insert = "insert into gardening_bookings(customer_email,agent_email,footage,date,time,unit_and_apt,street,suburb,total) values(?,?,?,?,?,?,?,?,?)";
                int i = 0;
                
            try{
                pst = con.prepareStatement(insert); 
                pst.setString(1,customer);
                pst.setString(2,agent);
                pst.setString(3, footage);
                pst.setString(4, date);
                pst.setString(5,time);
                pst.setString(6,apt);
                pst.setString(7,street);
                pst.setString(8,suburb);
                pst.setDouble(9,total);
                
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
}
//STR_TO_DATE(?,\"%Y/%m/%d\")