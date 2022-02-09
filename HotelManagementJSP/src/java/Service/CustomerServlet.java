/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Dao.GenericDao;
import Model.Customer;
import Model.CustomerCategory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alvaro
 */
@WebServlet(name = "Servlet", urlPatterns = {"/Servlet"})
public class CustomerServlet extends HttpServlet {
    GenericDao<Customer> csDao = new GenericDao<>(Customer.class);
    Customer customer = new Customer();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           String cusId = request.getParameter("customerId");
           String fn = request.getParameter("firstname");
           String ln = request.getParameter("lastname");
           String ph = request.getParameter("contact");
           String csCat = request.getParameter("customerCat");
          CustomerCategory cusCat = CustomerCategory.valueOf(csCat); 
           
           csDao.createA(new Customer(cusId, fn, ln, ph, cusCat)) ;
          
        } catch (Exception e) {
            System.out.println(""+e);
        }
        response.sendRedirect("Customer.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
