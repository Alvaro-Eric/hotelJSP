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
    <body>
        <form action="Servlet" method="POST">
            <table border="0">
                <%
                  CustomerCategory Cat[] = CustomerCategory.values();
                %>
                <tbody>
                    <tr><td>Customer ID</td><td><input type="text" name="customerId" value=""/></td></tr>
                    <tr><td>First Name</td><td><input type="text" name="firstname" value=""</td></tr>
                    <tr><td>Last Name</td><td><input type="text" name="lastname" value=""</td></tr>
                    <tr><td>Contact</td><td><input type="text" name="contact" value=""</td></tr>
                    <tr><td>Customer Category</td>
                        <td>
                        <select name="customerCat">
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
            <table border="1">
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
    </body>
</html>
