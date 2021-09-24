<%-- 
    Document   : LoggedInGardening
    Created on : 24 Sep 2021, 1:38:30 PM
    Author     : PLANDI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
        session = request.getSession(false);
        if(session.getAttribute("email")!=null){
        
        String email = session.getAttribute("email").toString(); 
    %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>ServiceMe|Gardening</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
            $(document).ready(function(){
               $("#date").val(new Date().toISOString().slice(0,10)); 
               
            });
           
               
              
            $(document).ready(function (){
                
                $("#proceed").click(function(){
                   
                    var footage = $("#footage").val(),
                        
                        date = $("#date").val(),
                        time = $("#time").val(),
                        location = $("#location").val(),
                        apt = $("#apt").val(),
                        street =$("#street").val();
                       
                        if(apt === "" || street === ""){
                            
                            alert("Please ensure that every fields are filled out correctly");
                        }
                        
                        else{
                            
                             $.post("GardeningTot",{
                        footage:footage,
                        date:date,
                        time:time,
                        location:location
                    }, function(data){
                        
                        $("#displaytotal").html("R " + data);
                        $("#displaydate").html(date + " @ "+ time);
                        $("#displayloc").html(apt + ", " + street + ", " + location);
                        $("#displayfootage").html(footage);
                    });    
                        }
                   
                });
            });
            
        </script>
        <link rel="stylesheet" href="style4.css">
    </head>
    <body>
        <div class="container">
           <div class="navbar">
            <div class="logo">
                <img src= "logo1.png" alt="" width="200">
            </div>
            <nav>
                <ul>
                    <li><a href="LoggedHomePage.jsp">Home</a></li>
                    <li><a href="LogOut">Log Out</a></li>
                    <li><a href="#"><i class="fa fa-user"></i><% out.print(email); %></i></a></li>
                </ul>
            </nav>
        </div> 
            <div class="row">
                <div class="col_2">
                    <h1>Welcome to our gardening service<br>Let us take care of your garden</h1>
                    <p>If your gardens got to wild and you have to little time on hand ;<br>
                        we can give you a helping hand. 
                        We maintain laws,<br> clean up over grow and make it neat and tidy for you.</p>
                </div>
                <div class="col_2">
                    <img src="" alt="">
                    
                </div>
            </div>
        </div>
        <div class="gardens">
            <div class="inner-container">
            <div class="row">
                <div class="col_3">
                    <img src="garden1.jpg" alt="">
                </div>
                <div class="col_3">
                    <img src="garden.jpg" alt="">
                </div>
                <div class="col_3">
                    <img src="garden3.jpg" alt="">
                </div>
            </div>
                </div>
        </div>
                <form method="post" action="Gardening">
          <div class="inner-container">
              <div class="dt">
              <h2 class="title">Book a service</h2>
              <h2><br>Enter your details</h2><br><br>
              <label for="footage"><b>Area Footage:</b></label>&emsp;&emsp;&nbsp;&nbsp;
              <select id="footage" name="footage" required>
                    <option >0-100 Square Feet</option>
                    <option >100-200 Square Feet</option>
                    <option >200-300 Square Feet</option>
                    <option >300-400 Square Feet+</option>
                  
              </select><br><br>
            
            
            <label for="time"><b>Time:</b></label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
            <select id="time" name="time">
                    <option value="08:00">08:00</option>
                    <option value="08:30">08:30</option>
                    <option value="09:00">09:00</option>
                    <option value="09:30">09:30</option>
                    <option value="10:00">10:00</option>
                    <option value="10:30">10:30</option>
                    <option value="11:00">11:00</option>
                    <option value="11:30">11:30</option>
                    <option value="12:00">12:00</option>

            </select><br><br>
            <label for="date"><b>Select a day:</b></label>&emsp;&emsp;&emsp;&nbsp;&nbsp;
            <input type="date" id="date" name="date" required><br><br>
            <label for="apt"><b>Unit & Apt Name:</b></label>&emsp;&nbsp;&nbsp;
            <input type="text" name="apt" id="apt" placeholder="e.g. 10 Westpark" required><br><br>
            <label for="street"><b>Street:</b></label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
            <input type="text" name="street" id="street" placeholder="e.g. Dreyer Street" required><br><br>
            <label for="location"><b>Set Your Location:</b></label>&nbsp;&nbsp;
            <select name="location" id="location" required>
                <option value="Observatory" >Observatory</option>
                <option value="Capetown" >Cape Town</option>
                <option value="Mowbray" >Mowbray</option>
                <option value="Claremont" >Claremont</option>
                <option value="Rosebank" >Rosebank</option>
                <option value="Plumstead" >Plumstead</option>
                <option value="Constantia" >Constantia</option>
                <option value="Diepriver" >Diep River</option>
                
                
            </select>
            <div class="submit">
                
                <br><input type="button" id="proceed" value="Proceed">
            </div>
            <div>
            <div class="display">
            <h2>Booking details</h2><br>
            
            <p><b>When:&emsp;</b><span id='displaydate'></span></p><br>
            <p><b>Location:&emsp;</b><span id='displayloc'></span></p><br>
            <p><b>Footage:&emsp;</b><span id='displayfootage'></span></p><br>
            <p><b>Total:&emsp;</b><span id='displaytotal'></span></p><br>
            
                 <div class="confirm"> 
                     <input type="submit" id="find" value="Find Agent"><br>
                 </div>
            </div>
            
        </div>
              </div>
          </div>
        </form>
        
        <div class="footer">
            <div class="inner-container logo">
                <div class="row">
                    <div class="col_4">
                        <img src="Facebook.png" alt="" >
                    </div>
                    <div class="col_4">
                        <img src="Twitter.png" alt="" >
                    </div>
                    <div class="col_4">
                        <img src="Ytb.png" alt="" >
                    </div>
                    
                </div>
            </div>
            
        </div>
        
    </body>
    
</html>
<%}
else{
response.sendRedirect("SignUpPage.html");
}
%>
