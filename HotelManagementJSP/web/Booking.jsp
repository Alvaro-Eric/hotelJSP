<%-- 
    Document   : Booking
    Created on : Jan 4, 2022, 8:57:15 AM
    Author     : Alvaro
--%>

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
    <body>
        <form action="BookingServlet" method="POST">
            <table border="0">
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
        
    </body>
</html>
