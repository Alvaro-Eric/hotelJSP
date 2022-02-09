<%-- 
    Document   : Customer
    Created on : Jan 4, 2022, 8:56:35 AM
    Author     : Alvaro
--%>

<%@page import="Model.CustomerCategory"%>
<%@page import="java.util.List"%>
<%@page import="Dao.GenericDao"%>
<%@page import="Model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Page</title>
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
/*            width: 125px;*/
            color: black;
/*            font-size: 30px;*/
            font-weight: 700;
        }
        #input select {
            height: 25px;
            width: 77%;
/*            padding: 10px;*/
        }
        #input tr td:nth-child(1){
           width: 10%; 
           font-size: 20px;
        }
        #input tr td:nth-child(2){
           width: 15%; 
        }
        #custable{
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
        #cust{
          position: relative;
          display: flex;
          flex-direction: row;
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
						<li>
							<a href="Rooms.jsp">Rooms</a>
						</li>
						<li class="selected">
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
        <div id="cust">
        <form action="Servlet" method="POST">
            <table id="input" border="0">
                <%
                  CustomerCategory Cat[] = CustomerCategory.values();
                %>
                <tbody>
                    <tr><td>Customer ID</td><td><input type="text" name="customerId" value=""  /></td></tr>
                    <tr><td>First Name</td><td><input type="text" name="firstname" value=""</td></tr>
                    <tr><td>Last Name</td><td><input type="text" name="lastname" value=""</td></tr>
                    <tr><td>Contact</td><td><input type="text" name="contact" value=""</td></tr>
                    <tr><td>Customer Category</td>
                        <td>
                            <select name="customerCat" >
                            <%   
                            for (CustomerCategory cc:Cat){
                            %>
                            <option><%=cc.toString()%></option>
                            <%}%>
                        </select>   
                        </td>    
                    </tr>
                    <tr><td><input type="submit" value="SAVE" name="submit"/></td></tr> 
                </tbody>
            </table>
        </form>
        <form>
            <table id="custable" border="1">
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Contact</th>
                        <th>Customer Category</th>
                    </tr>
                </thead>
                <%
                   GenericDao<Customer> csDao = new GenericDao<>(Customer.class);
                   Customer cu = new Customer();
                   List<Customer> cus = (List<Customer>)csDao.findAll();
                   for (Customer c:cus){
                %>
                
                    <tr>
                        <td><%=c.getCustomerid()%></td>
                        <td><%=c.getFirstname()%></td>
                        <td><%=c.getLastname()%></td>
                        <td><%=c.getContact()%></td>
                        <td><%=c.getCustomerCategory()%></td>
                    </tr>
                <%}%>  
            </table>

        </form>
       </div>     
    </body>
</html>
