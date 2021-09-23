<%-- 
    Document   : ListEmployee
    Created on : Sep 20, 2021, 4:03:16 PM
    Author     : dj sean
--%>

<%@page import="ServiceMe.DAO"%>
<%@page import="java.sql.*" %>

<%
    
ResultSet rs;
DAO dao;
%>

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
        <title>Service Me - Booking | Select Agent</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .header {
                
                padding: 5px;
                background: #1abc9c;
                box-shadow: 0 10px 15px #009999;
                color: white;
                border-radius: 20px;
                display: flex;
                justify-content: right;
                align-content: center;
            }
            /* Increase the font size of the heading */
            .title {
                font-family: "Sofia",sans-serif;
                color: white;
                font-size: 30px;
                font-weight:600;
                padding: 0px 10px 10px 10px;
                justify-content: flex-start;
                align-self:center;
                margin-left: 15px;
                margin-right: auto;
            }
            .title:link{
                color: whitesmoke;
                background-color: transparent;
                text-decoration: none;
            }
            
            .user{
                
                color: #fff;
                text-decoration: none;
                font-size: 20px;
                font-family: Playfair Display,sans-serif;
                padding: 0px 15px;
                align-self: center;
            }
            .logout{
                justify-content: flex-end;
                padding: 10px  10px  10px  10px;
                align-self: center;
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
            .logout:hover{
                
                background: #006666;
               
            }
            .footer {
                padding: 5px;
                background: #1abc9c;
                box-shadow: 0 10px 15px #009999;
                color: white;
                border-radius: 20px;
                text-align: center;
                position:  fixed;
                bottom: 0;
                width: 100%;
                height: 20px;
                border-radius: 30px;
            }
            .column {
                position:relative;
                margin: 0 -35px;
                display: inline-block;
                width: 250px;
                height: 400px;

            }



            label {
                position:relative;
                margin: 23px -35px;
                display: inline-block;
                width: 250px;
                height: 400px;
                line-height: 30px;
                color: #ddd;
                font-size: 1em;             
                box-shadow: 0 10px 6px -6px #777;
                -webkit-transform: skew(-20deg) rotate(-20deg);
                transform: skew(-20deg) rotate(-20deg);
                -webkit-transition: .3s;
                transition: .3s;
                border-radius: 35px;
                background: #1abc9c;
            }

            input[type="radio"] {
                display: none;
            }
            input[type="radio"]:checked ~ label {
                -webkit-transform: skew(20deg) rotate(20deg);
                transform: skew(20deg) rotate(20deg);
            }
            input[type="radio"]:checked + label {
                margin: 0 50px;
                -webkit-transform: none;
                transform: none;
                background: #1abc9c;
            }
            .card-slider{
                margin: 60px auto;
                text-align: center;
                border-radius: 35px;
            }
            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: 0;
                overflow: hidden;
                background-color:whitesmoke;
            }
            html {
                box-sizing: border-box;
            }
            *, *:before, *:after {
                box-sizing: inherit;
            }
            .card {

                margin: 1px;
                border-radius: 35px;
            }
            .container {
                display: none;
                position: absolute;
                top: 235px;
                width: 100%;
                line-height: 1em;
                border-radius: 25px;
                padding: 10px;
                background: #ff9900;
                    

                color: #fff;
                border: 1px solid #1a1a1a;
                font-size: 90%;
            }
            .column:hover .container {
                opacity: 0.8;
                display: block;
            }
            img{
                width:100% ;
                height: 195px;
                border-radius: 45px;
            }
            .checked {
                color: orange;
            }
            .row{
                width: 1200px;
                margin: 40px auto;
                height:500px;
                border-radius: 50px;
                overflow-x: hidden;
                overflow-y:scroll;
            }
            .row::-webkit-scrollbar {
                width: 20px;
            }
            .row::-webkit-scrollbar-track {
                box-shadow: inset 0 0 10px grey;
                border-radius: 10px;
            }
            .row::-webkit-scrollbar-thumb {
                background: #34b3a0; 
                border-radius: 10px;
            }
            .row::-webkit-scrollbar-thumb:hover {
                background: green; 
            }
            .btn{
                position: fixed;
                bottom: 0px;
                left: 50%;
                transform: translateX(-50%);
                opacity: 0.9;
                width:1000px;
                background: #34b3a0;
                height: 60px;
                line-height: 60px;
                color: #fff;
                text-transform: uppercase;
                text-align: center;
                font-weight: bold;
                letter-spacing: 1px;
                cursor: pointer;
                margin-bottom: 30px;
                border:#ffffff;
                border-radius: 10px;


            }
            .btn:hover {
                background-color: #006666;
            }


        </style>
        <script>
        </script>
    </head>
    
    
    
    <body>
        <div class="header">
            <a class=" title" href="#">Service Me</a>
            <a href="#" class="user" name="user" id="user"><i class="fa fa-user"></i><% out.print(email); %></i></a>
            <a class=" logout" href="LogOut">Log Out</a>
            
        </div>
        <form method="post" action="Agent">

            <div class="card-slider">
                <div class="row">
                    
                    <%
                        dao = new DAO("Plandi","Card@4817","service_me");
                        try{
                        rs = dao.agentList(svc);
                        int i = 0;
                        while(rs.next()){
                        
                    %>

                    <input type="radio" required value=<% out.print(rs.getString("email")); %> name="agent" id= <% out.print(""+i); %>  />
                    <label for=<% out.print(""+i); %>>
                        <div class="column">
                            <div class="card">

                                <img src= <% out.print(rs.getString("image")); %> alt=<% out.print(rs.getString("full_name")); %>
                                     <h3><% out.print(rs.getString("full_name")); %></h3>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star"></span>
                                
                            </div>
                                
                            <div class="container">

                                    <p><% out.print(rs.getString("description"));%></p>
                            </div>
                        </div>
                    </label>
                                <% i++; } 
                    dao.getCon().close();}catch(SQLException e){e.printStackTrace();}
                                %>
                    <hr>
                    <button class="btn" type="submit" name="confi">Pick Agent</button>
                </div>

            </div>

        </form>
        
    </body>
</html>
<%}
else{
response.sendRedirect("SignUpPage.html");
}
%>

