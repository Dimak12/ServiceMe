<%-- 
    Document   : BillingPage
    Created on : 24 Sep 2021, 2:28:59 PM
    Author     : PLANDI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
        session = request.getSession(false);
        if(session.getAttribute("email")!=null){
        String email = session.getAttribute("email").toString(); 
        String svc = session.getAttribute("svc").toString();
        
        
    %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>billing page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <script src="jquery-2.1.4.js"></script>
       <link href="Billingpagestyle.css" rel="stylesheet">
      
       <link href="Billingpagestyle2.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
      
    <div class="wrapper">
        <h1> Payment Form </h1>
        <form  method="post" action=<% if("cleaner".equals(svc)){out.print("Booking");} else {out.print("GardeningBooking");}%>>
     <h2>Account  </h2>
     <div class="input-group">
         <div class="input-box"> 
             <input type="text" name="fname"
              placeholder="Full name" required 
              pattern="[A-Za-z]*[]{A-Za-z}*"
              class="name">   
             <i class="fa fa-user icon "></i>
             
             <div class="input-box"> 
                 
             
             <div class ="input-group">
                 <div class="input-box"> 
                     <input type="email" name="email" class="name">
                 <i class="fa fa-envelope icon "></i>
                 <div class="input-group">
                     <div class="input-box">
                         
                       
                         <div class ="input-box">
                             
                             <h4>Gender</h4>
                             <input type="radio" id="b1"
                                    name="gendar" checked class="radio" value="male">
                             <label for="b1">Male</label>
                             <input type="radio" id="b2"
                                    name="gendar" class="radio" value="female">
                             <label for="b2">Female</label>
                             <div class="input-group">
                                 <div class="input-box">
                                     <h5>Payment Details</h5>
                                     <input type="radio" name="pay" value="credit card"
                                            
                                            id="bc1" checked class="radio" required>
                              <label for="bc1"><span><i class="fa fa-cc-visa"></i
                                      > Credit card
                                  </span></label>
                                  
                                     <input type="radio" name="pay" id="bc2" class="radio" value="paypal" required>   
                              <label for ="bc2"><span><i class="fa fa-cc-paypal"></i>Paypal</span></label>
                              <div class="input-group">
                                  
                                  <div class="input-box">
                                      
                                <input type="text" name="card"
                              placeholder="Card Number" required 
                              pattern="[0-9]{16}"
                              class="name">
                                <i class="fa fa-credit-card icon"></i>
                                <div class="input-group">
                                    <div class="input-box">
                                        <input type="tel" name="cvv" placeholder="CVV" required 
                                        pattern="[0-9]{3}"
                                        class="name">
                                        
                                        
                                        <i class="fa fa-user icon"></i>
                                        <div class="input-box">
                                            <input type="text" name="country" placeholder="Country" required class="country">
                                            <label class="exp">Expiry:</label>
                                            <input type="text" placeholder="mm/yy" class="expiry" name="expiry" required >
                                                
                                            
                                                
                                            <div class="input-group">
                                               
                                                <div class="input-box">
                                                    <button type="submit">PAY NOW</button>


                                                </div>    
                                                    
                                                </div>
                                                
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                    
                                </div>
                                    
                                    
                                </div>
                                      
                                
                                  
                                  </div>
                                  
                                  
                              </div>
                                 </div>
                             </div>
                            
                         </div>
                         
                     </div>
                 
                 </div>
                 
                 </div>
             
             </div>
             </div>
         </div>
    </div>
        </form>   
        
    </div> 
    <div id="overlay">
    <div class="loader"></div>
    </div>
    
    <script>
        
        var overlay= document.getElementById("overlay");
        window.addEventListener('load', function(){overlay.style.display ='none';});
      
    </script>
        
        
    </body>
</html>
<%}
else{
response.sendRedirect("SignUpPage.html");
}
%>