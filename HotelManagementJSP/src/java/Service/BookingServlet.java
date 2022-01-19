/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import Dao.BookingInterface;
import Dao.BookingRes;
import Dao.GenericDao;
import Dao.connectDB;
import Model.AvailableStatus;
import Model.Booking;
import Model.Customer;
import Model.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Alvaro
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    GenericDao<Booking> bkDao = new GenericDao<>(Booking.class);
    BookingInterface bki = new BookingRes();
    Customer c = new Customer();
    Room r = new Room();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String cs = request.getParameter("customerid");
            String rm = request.getParameter("roomid");
            String d1 = request.getParameter("sdate");
            String d2 = request.getParameter("edate");
            String sts = request.getParameter("rmStatus");
            AvailableStatus st = AvailableStatus.valueOf(sts);
            if(st.equals(AvailableStatus.OCCUPIED)){
              boolean booking = bki.occupiedRoom(cs,rm, d1, d2);
              if(booking){
              allOccupied();
              return;
              }else{
              return ;
               
              }

            }  
        } catch (Exception e) {
            System.out.println("" + e);
        }
        response.sendRedirect("index.html");
    }

    public void allOccupied() {

        try {
            PreparedStatement p = connectDB.getCon().prepareStatement("select  b.id as Id,b.customerid as CustomerId,"
                    + "b.roomid as Room,b.startdate as StartDate,b.enddate as EndDate,r.price as PayPerDay,DATEDIFF(b.enddate,b.startdate)*r.price"
                    + " as TotPrice from Booking b, Room r where r.roomid = b.roomid");
            ResultSet rs = p.executeQuery();

//            TransactionTable.setModel(DbUtils.resultSetToTableModel(rs));
        } catch (Exception e) {
            e.printStackTrace();
        }
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
