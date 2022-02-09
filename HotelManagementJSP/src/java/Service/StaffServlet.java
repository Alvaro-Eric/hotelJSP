/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Dao.AccountDao;
import Dao.GenericDao;
import Model.Gender;
import Model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alvaro
 */
@WebServlet(name = "StaffServlet", urlPatterns = {"/StaffServlet"})
public class StaffServlet extends HttpServlet {

    RequestDispatcher dispatcher;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDao<Staff> accountDao = new AccountDao<>(Staff.class);
        HttpSession session = request.getSession();
        //String action = request.getParameter("action");
        
//        switch (action) {
//            case "login":
                try{
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                Staff account = accountDao.getAccount(email, password);
                if (account == null) {
                    request.setAttribute("message", "username or password is invalid!!");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }else{
                 session.setAttribute("user", account);
                }
                }catch(Exception e){
                    System.out.println(""+e);
                    request.setAttribute("message","username or password is invalid!!");
                }
//                break;
//            case "logout":
//                request.getSession().removeAttribute("user");
                response.sendRedirect("Welcome.jsp");
                
//        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GenericDao<Staff> staffDao = new GenericDao<>(Staff.class);
//        String action = request.getParameter("action");
//        Staff staff;
        
//        switch(action){
//            case "addstaff":
//                staff = new Staff();
//                
//                staff.setFirstname(request.getParameter("firstName"));
//                staff.setUsername(request.getParameter("userName"));
//                staff.setContact(request.getParameter("phone"));
//                staff.setGender(request.getParameter(Gender.valueOf("Gender")));
//                staff.setLastname(request.getParameter("lastName"));
//                staff.setEmail(request.getParameter("email"));
//                staff.setPassword(request.getParameter("password"));
//                
//                staffDao.createA(staff);
//                
//                response.sendRedirect("SignUp.html");
//                break;
////            case "createstaff":
////                staff = 
//                
//            default:
//                System.out.println("no action specified");
//        }
          try{
              String fn = request.getParameter("firstName");
              String usn = request.getParameter("userName");
              String ct = request.getParameter("phone");
              String gn = request.getParameter("Gender");
              String ln = request.getParameter("lastName");
              String em = request.getParameter("email");
              String psw = request.getParameter("password");
              Gender gender = Gender.valueOf(gn);
              
              staffDao.createA(new Staff(fn, ln, usn, em, psw, ct, gender));
          }catch(Exception e){
              System.out.println(""+e);
          }
          response.sendRedirect("SignUp.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
