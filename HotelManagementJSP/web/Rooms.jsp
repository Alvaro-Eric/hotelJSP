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
    <body>
        <form action="RoomServlet" method="POST">
            <table border="0">
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
            <table border="1">
                <thead>
                    <tr>
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
