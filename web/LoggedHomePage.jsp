<%-- 
    Document   : LoggedHomePage
    Created on : 18 Sep 2021, 5:10:37 PM
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
        <title>Service Me</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
           
            .menu{
                background-color: #34b3a0;
                /*height: 60px;*/
                min-height: 60px;
                width:100%;
                display: flex;
                align-content: center;
                align-items: center;
                justify-content: flex-end;
                flex-wrap: wrap;
                
            }
            
            .logo{
                margin-right:auto;
                margin-left: 15px;
                color: #fff;
                font-family: "Sofia",sans-serif;
                font-size: 30px;
                font-weight: bold;
                text-decoration: none;
            }
            
            .menu .user {
                
                color: #fff;
                text-decoration: none;
                font-size: 20px;
                font-family: Playfair Display,sans-serif;
                padding: 0px 15px;
                
            }
            
            .menu ul{
                list-style: none;
                display: flex;
                height: 100%;
            }
            
            .menu ul li{
                padding: 10px 30px;
                position: relative;
                height: 100%;
                
                
            }
            
            .menu ul li a{
                color: #fff;
                text-decoration: none;
                font-size: 20px;
                font-family: Playfair Display,sans-serif;
                padding: 0px 15px;
            }
            
            .menu ul li .menu-item{
                
                padding: 15px 10px;
                
            }
            .menu .options li a:hover{
                background: #006666;
            }
            .dropdown{
                display: none;
                
            }
            .menu ul li:hover .dropdown{
                display: block;
                position: absolute;
                left: 0;
                top:100%;
                background-color: #34b3a0;
                
            }
            .dropdown ul{
                display: block;
                margin: 10px;
               
            }
            .dropdown ul li{
                padding: 10px;
                width: 200px;
                
            }
            
            .dropdown ul li:hover{
                 background: #006666;
            }
            
            .fa{
                margin-left: 5px;
            }
            
            .fa-user{
                margin-right: 5px;
            }
            
            .main{
                display: flex;
                flex-direction: column;
                height:calc(100vh - 60px);
                background-image: url("background7.JPG");
                background-position: center;
                background-size: cover;
                background-repeat: no-repeat;
                /*justify-content: center;*/
                align-items: center;
                 
            }
            
           
            
            .message{
                text-align: center;
                margin-top: 100px;
                color: #fff;
            }
            
            .message h2{
                font-family: Playfair Display,sans-serif;
            }
            
            .search-bar{
                
                margin-top: 30px;
            }
            .searchbtn{
                
                position: relative;
                width: 375px;
                height: 50px; 
                cursor: pointer;
                padding: 5px 15px;
                background-color: #34b3a0;
                font-family: Playfair Display,sans-serif;
                font-size: 20px;
                margin: 0;
                text-align: left;
                border:  #006666;
                outline: #009999;
                color: white;
            }
            .search-content{
                display: none;
                position: absolute;
                width: 375px;
                background-color: #34b3a0;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                margin-top: 3px;
                
            }
            .links{
                display: flex;
                flex-direction: column; 
                padding: 10px;
            }
            .links a{
                color: #fff;
                text-decoration: none;
                font-size: 20px;
                font-family: Playfair Display,sans-serif;
                padding: 10px;
            }
            .links a:hover{
                 background: #006666;
            }
            
            #caret{
                
               padding-left: 10px;
               pointer-events: none;
            }
            
            
            .show{
                display: block;
            }
           
        </style>
    </head>
    
    
    
    <body>
        <div class="menu">
            
            <a href="#" class="logo">Service Me</a>
            <a href="#" class="user" name="user" id="user"><i class="fa fa-user"></i><% out.print(email); %></i></a>
            <ul class="options">
                
                <li><a href="#" class="menu-item">Book A Service<i class="fa fa-caret-down"></i></a>
                    <div class="dropdown">
                        <ul>
                            <li><a href="LoggedHouseCleaning.jsp" >House Cleaning</a></li>
                            <li><a href="LoggedInGardening.jsp">Gardening</a></li>
                        </ul> 
                    </div>
                </li>
                <li><a href="LogOut" class="menu-item">Log Out</a></li>
            </ul>
        </div>
        <div class="main">
            <div class="message">
                <p><h2><b>Welcome to Service Me</b></h2><p>
                <p><h2><b>We offer multiple services to make your life easier</b></h2><p>
                <p><h2><b>Outstanding service makes the difference</b></h2><p>
            </div>
            <div class="search-bar">
                <button class="searchbtn" onclick="drop()">Which service are you looking for?
                <i class="fa fa-caret-down" id="caret"></i>
                </button>
                <div class="search-content" id="content">
                    <div class="links">
                        <a href="LoggedHouseCleaning.jsp">House Cleaning</a>
                        <a href="LoggedInGardening.jsp">Gardening</a>
                        
                    </div>
                    
                </div>
            </div>
        </div>
        <script>
            function drop(){
                document.getElementById("content").classList.toggle("show");
            }
            
            window.onclick = function(e){
                if(!e.target.matches('.searchbtn')){
                    var content = document.getElementById("content");
                    if(content.classList.contains('show')){
                        content.classList.remove('show');
                    }
                }
            };
        </script>
    </body>
</html>
<%}
else{
response.sendRedirect("SignUpPage.html");
}
%>

