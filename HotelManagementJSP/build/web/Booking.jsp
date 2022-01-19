<%-- 
    Document   : Booking
    Created on : Jan 4, 2022, 8:57:15 AM
    Author     : Alvaro
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.sun.javafx.css.CalculatedValue"%>
<%@page import="Model.Booking"%>
<%@page import="Model.AvailableStatus"%>
<%@page import="Dao.GenericDao"%>
<%@page import="java.util.List"%>
<%@page import="Model.Room"%>
<%@page import="Model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
    </head>
    <style>
        body{
            font-family: sans-serif;
            background-image: url(bg-pattern.jpg);
            background-size: cover;
        }
        #input{
            position: absolute;
            top: 10%;
            left:10%;
/*            margin-left: 80px;*/
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            margin-top: 30px;
            width: 125px;
            color: black;
            font-size: 18px;
            font-weight: 700;
        }
        #bktable{
            position: absolute;
            top: 10%;
            left: 40%;
            right: 10%;
            font-size: 18px;
/*            margin-left: 80px;*/
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
/*            margin-top: 10px;*/
            width: 80px;
            color: black;
            font-weight: 100;

        }
        #head{
            background-color: background;
        }
        #body{
            background-color: green;
        }
        #booking{
            background-image: url("images\suite.jpg");
        }
        #btn {
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
        }
        #navigation {
	background: url(../images/bg-navigation.png) no-repeat;
	clear: both;
	height: 50px;
	width: 760px;
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
                color: #e4e1bd;
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
							<a href="index.html">Home</a>
						</li>
						<li>
							<a href="Rooms.jsp">Rooms</a>
						</li>
						<li>
							<a href="Customer.jsp">Customer</a>
						</li>
						
						<li class="selected">
							<a href="Booking.jsp">Booking</a>
						</li>
					</ul>
				</div>
			</div>
			
                </div>
        </div>
<!--        <a href="index.html"><button id="btn" >Back</button></a>-->
        <div id="booking">
        <form action="BookingServlet" method="POST">
            <table id="input" border="0">
                <%
                    GenericDao<Customer> csDao = new GenericDao<>(Customer.class);
                    GenericDao<Room> rmDao = new GenericDao<>(Room.class);
                    Customer cu = new Customer();
                    Room rm = new Room();
                    AvailableStatus types[]=AvailableStatus.values();
                    List<Customer> cus = (List<Customer>)csDao.findAll();
                    List<Room> rms = (List<Room>)rmDao.findAll();
                    
                %>
                
                <tbody>
                    <tr><td>Customer ID</td>
                        <td>
                        <select name="customerid">
                            <%   
                            for (Customer c:cus){
                            %>
                             <option><%=c.getCustomerid()%></option>
                            <%}%> 
                        </select>   
                        </td>    
                    </tr>
                    <tr><td>Room ID</td>
                        <td>
                        <select name="roomid">
                            <%   
                            for (Room r:rms){
                            %>
                            <option><%=r.getRoomid()%></option>
                            <%}%>
                        </select>   
                        </td>    
                    </tr>
                    <tr><td>Starting Date</td><td><input type="date" name="sdate" value=""/></td></tr>
                    <tr><td>Ending Date</td><td><input type="date" name="edate" value=""/></td></tr>
                    <tr><td>Change Room Status</td>
                        <td>
                        <select name="rmStatus">
                            <%   
                            for (AvailableStatus tt:types){
                            %>
                            <option><%=tt.toString()%></option>
                            <%}%>
                        </select>   
                        </td>    
                    </tr>
                    <tr><td><input type="submit" value="SAVE" name="submit"/></td></tr> 
                </tbody>
            </table>
        </form>
        <form>
        <table  id="bktable" border="1">
                <thead>
                <tr id="head">
                    <th>B/N</th>
                    <th>Customer ID</th>
                    <th>Room ID</th>
                    <th>Starting Date</th>
                    <th>Ending Date</th>
                    <th>PayPerDay</th>
                    <th>TotPay</th>
                </tr>    
                </thead>
                <%
                   GenericDao<Booking> bkingDao = new GenericDao<>(Booking.class);
                   Booking bk = new Booking();
                   List<Booking> bks = (List<Booking>)bkingDao.findAll();
                   
                   for(Booking b:bks){
                   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                   String day1 = b.getStartDate();
                   String day2 = b.getEndDate();
                   LocalDate localdate1 = LocalDate.parse(day1, formatter);
                   LocalDate localdate2 = LocalDate.parse(day2, formatter);
                   Period p = Period.between(localdate1, localdate2);
                   int days = p.getDays();
                %>
                  <tr id="body"> 
                         <td><%=b.getId()%></td>
                         <td><%=b.getCustomer().getCustomerid()%></td>
                         <td><%=b.getRoom().getRoomid()%></td>
                         <td><%=b.getStartDate()%></td>
                         <td><%=b.getEndDate()%></td>
                         <td><%=b.getRoom().getPrice()%></td>
                         <td><%=days * b.getRoom().getPrice()%></td>
                                           
                  </tr>
                  
                <%}%>
            </table>
            </form>
        </div>       
    </body>
</html>
