<%-- 
    Document   : Rooms
    Created on : Jan 4, 2022, 8:56:50 AM
    Author     : Alvaro
--%>

<%@page import="Model.AvailableStatus"%>
<%@page import="Model.Capacity"%>
<%@page import="java.util.List"%>
<%@page import="Dao.GenericDao"%>
<%@page import="Model.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Page</title>
    </head>
    <style>
        body{
            font-family: sans-serif;
            background-image: url(bg-pattern.jpg);
            background-size: cover;
        }
        #input{
            position: absolute;
            top: 15%;
            left:10%;
/*            margin-left: 80px;*/
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            margin-top: 30px;
            width: 125px;
            color: black;
            font-size: 15px;
            font-weight: 700;
        }
        #input select {
            height: 25px;
            width: 99%;
/*            padding: 10px;*/
        }
        #input tr td:nth-child(1){
           width: 10%; 
           font-size: 20px;
        }
        #input tr td:nth-child(2){
           width: 15%; 
        }
        #roomtable{
            position: absolute;
            top: 15%;
            left: 35%;
            font-size: 20px;
/*            margin-left: 80px;*/
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            margin-top: 30px;
            width: 55%;
            color: black;
            font-weight: 700;

        }
        #head{
            background-color: background;
        }
/*        #btn {
            position: absolute;
            top: 2%;
            left: 1%;
            border: 0;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            font-size: 30px;
            background: none;
            display: block;
            margin: 5px 0px;
            text-align: right;
            border: 0px solid rgb(241, 241, 248);
            padding: 10px 20px;
            outline: none;
            color: white;
            border-radius: 40px;
            transition: 0.25s;
            cursor: pointer;
        }
        #btn:hover {
          background: black;
        }*/
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
							<a href="Welcome.jsp">Home</a>
						</li>
						<li class="selected">
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
<!--        <a href="index.html"><button id="btn" >Back</button></a>-->
        <form action="RoomServlet" method="POST">
            <table id="input" border="0">
                <%
                    AvailableStatus types[]=AvailableStatus.values();
                    Capacity cpc[] =Capacity.values();
                %>
                <tbody>
                    <tr><td>RoomId</td><td><input type="text" name="room" value=""/></td></tr>
                    <tr><td>Beds</td><td><input type="text" name="bed" value=""</td></tr>
                    <tr><td>Available</td>
                        <td>
                        <select name="available">
                            <%   
                            for (AvailableStatus tt:types){
                            %>
                            <option><%=tt.toString()%></option>
                            <%}%>
                        </select>
                        </td>    
                    </tr>
                    <tr><td>Capacity</td>
                        <td>
                        <select name="capacity">
                            <%   
                            for (Capacity c:cpc){
                            %>
                            <option><%=c.toString()%></option>
                            <%}%>
                        </select>   
                        </td>    
                    </tr>
                    <tr><td>Price</td><td><input type="text" name="price" value=""</td></tr>
                    <tr><td><input type="submit" value="SAVE" name="submit"/></td></tr> 
                </tbody>
            </table>
        </form>
        <form>
            <table id="roomtable" border="1">
                <thead>
                    <tr id="head">
                        <th>Room ID</th>
                        <th>BEDS</th>
                        <th>Capacity</th>
                        <th>Status</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <%
                   GenericDao<Room> rmDao = new GenericDao<>(Room.class);
                   Room rm = new Room();
                   List<Room> rms = (List<Room>)rmDao.findAll();
                   for (Room r:rms){
                %>
                
                    <tr>
                        <td><%=r.getRoomid()%></td>
                        <td><%=r.getBeds()%></td>
                        <td><%=r.getCapacity()%></td>
                        <td><%=r.getStatus()%></td>
                        <td><%=r.getPrice()%></td>
                    </tr>
                <%}%>  
            </table>

        </form>
    </body>
</html>
