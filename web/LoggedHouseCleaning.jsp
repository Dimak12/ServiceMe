<%-- 
    Document   : LoggedHouseCleaning
    Created on : 18 Sep 2021, 7:32:22 PM
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
        <title>Service Me - Booking | House Cleaning</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
               
            }
           
            .container{
                display:grid;
                grid-template-columns: 2fr 1fr;
                grid-template-rows: 0.1fr 0.2fr 1fr;
                grid-template-areas: "nav nav" "header header" "main main" ;
                height: 100vh;
                grid-column-gap: 3px;
                grid-row-gap: 3px;
                
            }
            
            .nav{
                grid-area: nav;
                background-color: #34b3a0;
                display: flex;
                justify-content: right;
                align-content: center;
                
            }
            
            .nav .user{
                
                color: #fff;
                text-decoration: none;
                font-size: 20px;
                font-family: Playfair Display,sans-serif;
                padding: 0px 15px;
                align-self: center;
            }
            
             
            .header{
                display: flex;
                grid-area: header;
                align-items: center;
                justify-content: center;
                font-family: Playfair Display,sans-serif;
                flex-direction: column;
                
            }
            
            .fa-user {
                
                margin-right:5px;
            }
             
            .main{
                grid-area: main;
                
                
            }
            
            #house{
                display: flex;
                height: 100%;
                overflow-y: scroll;
               overflow: hidden;
               
            }
            
            
            #house .side{
                border: 1px solid #ddd;
                /*background-color: #00cccc;*/
                flex:1;
                margin: 3px;
            }
             
            .aside{
                grid-area: aside;
                background-color: #00cccc;
            }
            .title{
                justify-content: flex-start;
                align-self:center;
                margin-left: 15px;
                margin-right: auto;
                color: #fff;
                font-family: "Sofia",sans-serif;
                font-size: 30px;
                font-weight:600;
            }
            .title:link{
                color: white;
                background-color: transparent;
                text-decoration: none;
            }
            .logout{
                justify-content: flex-end;
                padding: 10px  10px  10px  10px;
                align-items: center;
                margin-right: 15px;
                font-size: 20px;
                font-family: Playfair Display,sans-serif;
                
                
            }
            
            
            .logout:link{
                
                color: white;
                background-color: transparent;
                text-decoration: none;
               
                
            }
            
            .logout:visited{
                
                color: #fff;
            }
            .nav .logout:hover{
                
                background: #006666;
               
            }
             
            .footer{
                grid-area: footer;
                background-color: #ff00cc
            }
            .details{
                border: 1px solid #ddd;
                width: 65%;
                height: 100%;
                display: grid;
                margin: 5px;
                grid-template-columns: 1fr 1fr;
                grid-template-rows: 0.5fr 1fr 1fr 1.5fr  ;
                grid-template-areas: "message message" "bedroom bathroom" "date time" "bottom bottom";
                /*overflow-y: scroll;
                overflow-x: scroll;*/
                /*overflow: hidden;*/
                    
            }
            .info{
               border: 1px solid #ddd;
               width: 35%;
               height: 100%;
               margin: 5px;
               display: flex;
               flex-direction: column;
               /*overflow-y: scroll;
               overflow-x: scroll;*/
               justify-content: center;
               align-content: center;
               align-items: center;
            }
            .info div{
                margin: 10px 10px;
                /*width: 80%;*/
               
                
            }
            .info label{
              
                font-size: 15px;
                font-family: Playfair Display,sans-serif;
                font-weight: bold;
            
            }
            
            .info-lab{
            
                color: #666666;
            }
            
           
            
            .info-divs{
                
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            
            .info-lab{
                
                margin-bottom: 8px;
            }
            
            .text  {
               
                text-align: center;
                font-size: 15px;
                font-family: Playfair Display,sans-serif;
                font-weight: bold;
                width: 100%
            }
           
            .bedroom{
                grid-area:bedroom;
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100%;
              
            }
            .bedroom input{
                
                width: 100px;
                
                margin-top: 15px;
            }
            
             .bathroom{
                 grid-area:bathroom;
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100%;
            }
            .bathroom input{
                margin-top: 15px;
                width: 100px;
            }
            
            
             .date{
                grid-area:date;
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100%;
            }
            .date input{
                margin-top: 15px;
                width: 100px;
                font-family: lato,sans-serif;
                cursor: pointer;
                
            }
            
             .time{
                grid-area:time;
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100%;
            }
            .time select{
                margin-top: 15px;
                width: 100px;
                width: 150px;
                height: 30px;
                border: 1px solid #34b3a0;
                font-family: lato,sans-serif;
                outline: none;
                padding-left: 10px;
                cursor: pointer;
            }
            
            .time select option{
                background: #34b3a0;
                color:#fff;
                padding: 10px;
                font-size: 15px;
                font-family: Playfair Display,sans-serif;
                
                
            }
            .bottom {
                grid-area:bottom;
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100%;
             
            }
            
            .location{
                
                display: flex;
                align-items: center;
                
                
            }
            
            .location div {
                display:flex;
                flex-direction: column;
                align-items: center;
                margin: 10px;
                
            }
            
            .location div label{
                
                margin-bottom: 10px;
            }
            .location select{
                width: 200px;
                
                height: 30px;
                border: 1px solid #34b3a0;
                font-family: lato,sans-serif;
                outline: none;
                padding-left: 10px;
                cursor: pointer;
            }
            .location select option{
                background: #34b3a0;
                color:#fff;
                
                font-size: 15px;
                font-family: Playfair Display,sans-serif;
                
            }
            
            .location button{
                
                margin-top: 10px;
            }
           
            .message{
                grid-area: message;
                display: flex;
                justify-content: center;
                align-items:center;
                padding: 10px;
                
                font-family: Playfair Display,sans-serif;
            }
            
            .details input{
                width: 150px;
                height: 30px;
                outline: none;
                border: 1px solid #34b3a0;
                font-family: lato,sans-serif;
                padding: 10px;
            }   
            
            .details label{
                font-size: 15px;
                font-family: Playfair Display,sans-serif;
                font-weight: bold;
            }
            
            #house button{
                
                width:80px;
                height:35px;
                background-color: #34b3a0;
                border: none;
                outline:none;
                color:#fff;
                font-family: Playfair Display,sans-serif;
                font-size: 15px;
                cursor: pointer;
            }
            
            .info #find{
                width: 150px;
                margin-bottom: 5px;
            }
            
            #bottom-header{
                
                margin-bottom: 15px;
            }
            
            .line{
                
                border-bottom: 1px solid #ddd;
                width: 80%;
            }
            
            
          
        </style>
    </head>
    
    
    <body>
        <div class="container">
            <nav class="nav">
                <a class="title" href="LoggedHomePage.jsp">Service Me</a>
                <a href="#" class="user" name="user" id="user"><i class="fa fa-user"></i><% out.print(email); %></i></a>
                <a href="LogOut" class="logout">Log Out</a>
            
            </nav>
           
                <header class="header">
                    <h2><b>Indoor House Cleaning</b></h2>
                    <h5>Let's Take Care Of Your House</h5>

                </header>
            <main class="main">
                
                <form id="house" method="POST" action="HCleaning">
                    <div class="details">
                        <div class="message"><h4>Enter the details of the service</h4></div>
                        <div class="bedroom">
                            <label>Number of bedrooms</label>
                            <input type="number" min="0" value="1" id="bedrooms" name="bedrooms">
                        </div>
                        <div class="bathroom">
                            <label>Number of bathrooms</label>
                            <input type="number" min="0" value="1" id="bathrooms" name="bathrooms">
                        </div>
                        <div class="date">
                            <label>Select a day</label>
                            <input type="date" id="date" name="date" required>
                        </div>
                        <div class="time">
                            <label>Select the time</label>
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
                                
                            </select>
                        </div>
                        <div class="bottom">
                            <label id="bottom-header">Enter your location</label>
                            <div class="location">
                                
                                
                                <div>
                                    <label>Unit & Apt Name</label>
                                    <input type="text" name="apt" id="apt" placeholder="e.g. 10 Westpark" required>
                                </div>
                                <div>
                                    <label>Street</label>
                                    <input type="text" name="street" id="street" placeholder="e.g. Dreyer Street" required>
                                </div>
                                <div> 
                                    <label>Suburb</label>
                                    <select id="location" name="location" >
                                        <option value="Observatory">Observatory</option>
                                        <option value="Cape Town">Cape Town</option>
                                        <option value="Mowbray">Mowbray</option>
                                        <option value="Claremont">Claremont</option>
                                        <option value="Rosebank">Rosebank</option>
                                        <option value="Plumstead">Plumstead</option>
                                        <option value="Constantia">Constantia</option>
                                        <option value="Diep River">Diep River</option>
                                    </select>
                                </div>

                            </div>
                            <button type="button" id="proceed">Proceed</button>
                        </div>
                        
                    </div>
                    <div class="info">
                        
                        <div id="info-date" class="info-divs">
                            <label class="info-lab">When</label>
                            <label id="timelab"></label>
                        </div>
                        <div id="info-location" class="info-divs">
                            <label class="info-lab">Where</label>
                            <label  id="locationlab"></label>
                        </div>
                        <div id="info-rooms" class="info-divs">
                            <label class="info-lab">Rooms</label>
                            <label id="roomslab"></label>
                        </div>
                        <div id="info-total" class="info-divs">
                            <label class="info-lab">Total</label>
                            <label id="totallab"></label>
                        </div>
                        <div class="line"></div>
                        <div class="text">
                            <p>Living room and Kitchen are already included</p></br>
                            <p>Thank you for choosing us. Our aim is to meet our customers satisfaction.</p>
                        </div>
                        <button type="submit" id="find" class="find">Find an agent</button>
                        
                    </div>
                    
                </form>
            </main>
           
        </div>
        <script>
            $(document).ready(function(){
               $("#date").val(new Date().toISOString().slice(0,10)); 
               
            });
            $(document).ready(function (){
                
                $("#proceed").click(function(){
                   
                    var bedrooms = $("#bedrooms").val(),
                        bathrooms = $("#bathrooms").val(),
                        date = $("#date").val(),
                        time = $("#time").val(),
                        location = $("#location").val(),
                        apt = $("#apt").val(),
                        street =$("#street").val();
                        
                        if(apt === "" || street === ""){
                            
                            alert("Please ensure that every fields are filled out correctly");
                        }
                        
                        else{
                            
                             $.post("TotalCalc",{
                        bedrooms:bedrooms,
                        bathrooms:bathrooms,
                        date:date,
                        time:time,
                        location:location
                    }, function(data){
                        
                        $("#totallab").html("R " + data);
                        $("#timelab").html(date + " @ "+ time);
                        $("#locationlab").html(apt + ", " + street + ", " + location);
                        $("#roomslab").html(bedrooms+" bedrooms" +" @ "+bathrooms+" bathrooms");
                    });    
                        }
                   
                });
            });
            
        </script>
    </body>
</html>
<%}
else{
response.sendRedirect("SignUpPage.html");
}
%>
