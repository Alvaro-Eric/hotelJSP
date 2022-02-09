<%-- 
    Document   : Welcome
    Created on : Feb 9, 2022, 10:41:23 AM
    Author     : Alvaro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Management system</title>
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
        .logout-box input[type="Submit"] {
            position: absolute;
            top: 2%;
            right: 1%;
            border: 0;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            background: none;
            display: block;
            margin: 5px 0px;
            text-align: right;
            border: 0px solid rgb(241, 241, 248);
            padding: 10px 20px;
            outline: none;
            color: white;
            border-radius: 20px;
            transition: 0.25s;
            cursor: pointer;
        }
        .logout-box input[type="Submit"]:hover {
            background: aquamarine;
        }
        </style>
    </head>
    <body>
        <%
            if(session.getAttribute("user")==null)
            {
              response.sendRedirect("login.jsp");
            }
        %>
        <form action="logout">
            <div class="logout-box">
            <input type="Submit" value="LOGOUT">
            </div>
        </form>
        
        <div id="background">
		<div id="page">
			<div id="header">
<!--				<div id="logo">
					<a href="index.html"><img src="images/logo.jpg" alt="LOGO" height="112" width="118"></a>
				</div>-->
				<div id="navigation">
					<ul>
						<li class="selected">
							<a href="Welcome.jsp">Home</a>
						</li>
						<li>
							<a href="Rooms.jsp">Rooms</a>
						</li>
						<li>
							<a href="Customer.jsp">Customer</a>
						</li>
						
						<li>
							<a href="Booking.jsp">Booking</a>
						</li>
					</ul>
				</div>
			</div>
			
                </div>
        </div>
    </body>
</html>
