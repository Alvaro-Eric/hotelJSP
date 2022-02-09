<%-- 
    Document   : SignUp
    Created on : Feb 8, 2022, 10:53:22 AM
    Author     : Alvaro
--%>

<%@page import="Model.Gender"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SignUp Form</title>
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
    <body class="resident">
        <div id="background">
		<div id="page">
			<div id="header">
<!--				<div id="logo">
					<a href="index.html"><img src="images/logo.jpg" alt="LOGO" height="112" width="118"></a>
				</div>-->
				<div id="navigation">
					<ul>
						<li>
							<a href="#">Home</a>
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
        <div class="lgin"><h1><a href="login.jsp">LOGIN</a></h1></div>
        <section id="form">
            <div class="resident_form">
                <h1>SIGN UP</h1></div>
            <div class="main">        
                <form action="StaffServlet" method="POST">
                    <div id= "name">
                        <div id= "left">
                            <%
                              Gender gnd[] =Gender.values();
                            %>
                            <label >Firstname</label></br>
                            <input type="text" name="firstName" placeholder=" First Name"/></br>
                            <label >Username</label></br>
                            <input type="text" name="userName" placeholder=" Username"/></br>
                            <label>Phone Number</label></br>
                            <input type="tel" name="phone" placeholder="+250"/></br>
                            <label>Gender</label></br>
                            <select name="Gender" >
                                <%
                                  for (Gender g:gnd){
                                %>
                                <option><%=g.toString()%></option>
                                <%}%>
                            </select></br>
                        </div>
                        <div id= "right">
                            <label >Lastname</label></br>
                            <input type="text" name="lastName" placeholder=" Last Name"/></br>
                            <label>E-mail</label></br>
                            <input type="email" name="email" placeholder="E-mail"/></br>
                            <label>Password</label></br>
                            <input type="password" name="password" placeholder="********"/></br>
                            <!--                <label>Confirm password</label></br>
                                            <input type="password" name="passwordConfirm" placeholder="********"/></br>-->
                        </div>
                    </div>
                    <input  type="submit" name="save" value="Register">  
                </form> 
            </div>
        </section>
    </body>
</html>
