<%-- 
    Document   : login
    Created on : Feb 8, 2022, 11:51:23 AM
    Author     : Alvaro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body{
            font-family: sans-serif;
            background-image: url(bg-pattern.jpg);
            background-size: cover;
        }    
        #navigation {
            background-image: url(../images/bg-navigation.png);
            background-repeat: no-repeat;
            background-position: top center;
            background-size: cover;
            clear: both;
            height: 70px;
    /*	width: 760px;*/
            margin: 0 auto;
            padding: 1px;
        }
        #navigation ul {
        /*	display: inline-block;*/
        /*	width: 560px;*/
                position: absolute;
                right: 30%;
                list-style: none;
                margin: 0;
                padding: 0;
        }
        #navigation li {
                float: left;
        /*	background-position: 0 -118px;*/
                background-repeat: no-repeat;
                height: 49px;
                width: 122px;
                margin: 0;
                padding-left: 1px;
                text-align: center;
        }
        #navigation li:first-child {
                background: none;
                margin-left: 0;
                padding-left: 0;
        }
        #navigation li a {
                color: #fff;
                display: block;
                font: bold 14px/48px Arial, Helvetica, sans-serif;
                height: 0px;
                text-transform: uppercase;
        }
        #navigation li a:hover {
                background-position: 0 -59px;
                color: #6d6157;
        }
        #navigation li.selected a {
                background-position: 0 0;
                color: grey;
        }
        </style>
    </head>
    <body>
        <div id="background">
		<div id="page">
			<div id="header">
<!--				<div id="logo">
					<a href="index.html"><img src="images/logo.jpg" alt="LOGO" height="112" width="118"></a>
				</div>-->
				<div id="navigation">
					<ul>
						<li>
							<a href="Homepage.html">Home</a>
						</li>
						<li>
							<a href="#">About Us</a>
						</li>
						<li>
							<a href="#">Contact Us</a>
						</li>
						
						<li class="selected">
							<a href="SignUp.jsp">SINUP</a>
						</li>
					</ul>
				</div>
			</div>
			
                </div>
        </div>
        <form action="StaffServlet" method="GET">
        <div class="login-box">
            <h1>Login</h1>
            <%
                if (request.getAttribute("message") != null) {
            %>
            <h2 style="color: red;font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;position: absolute;
             top: 15%;left:4%;font-size: 20px;"><%=request.getAttribute("message")%></h2>
            <%}%> 
            <div class="textbox">   
            <input type="text" placeholder="Email" name="email" value="">
            </div>
            
            <div class="textbox">
            <input type="password" placeholder="Password" name="password" value="">
            </div>

         <input type="Submit" name="" value="Login">
         
        </div>
        </form> 
    </body>
</html>
