/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.AvailableStatus;
import Model.Booking;
import Model.Customer;
import Model.CustomerCategory;
import Model.Room;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Alvaro
 */
public class BookingRes implements BookingInterface {
    GenericDao<Booking> bkingDao = new GenericDao<>(Booking.class);
    GenericDao<Room> rmDao = new GenericDao<>(Room.class);
    GenericDao<Customer> cusDao = new GenericDao<>(Customer.class);
     private Map<String, String> errors;
    Booking bking = new Booking();
    Customer cu = new Customer();
    
    @Override
    public void availableRoom(String roomId) {
      Room rm = rmDao.findById(roomId);
      
      bkingDao.createA(new Booking(rm, AvailableStatus.AVAILABLE));
      rm.setStatus(AvailableStatus.AVAILABLE);
      rmDao.updateA(rm);
      
    }

    @Override
    public boolean occupiedRoom(String customerId ,String roomId, String startDate, String endDate) {
     errors = new HashMap();
     Room rm = rmDao.findById(roomId);
     Booking book = bkingDao.findBookingByRoomId(roomId);
     Customer c = cusDao.findById(customerId);
     String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); 
     if(rm == null){
       throw new RuntimeException("We Don't have this Room");
     }
     if(startDate.compareTo(endDate)>0){
       throw new RuntimeException("Invalid Dates");
//        errors.put("startdate","Invalid Dates");
     }
     if(startDate.compareTo(today)<0){
       throw new RuntimeException("Booking don't work in past days");
//        errors.put("startdate", "Booking don't work in past days");
     }
     if(rm.getStatus()== AvailableStatus.OCCUPIED && (startDate.compareTo(book.getEndDate())<=0)){
      throw new RuntimeException("This room is Occupied");
//        errors.put("rm", "This room is Occupied");
     }
//     if(startDate.compareTo(book.getStartDate())==0 && (endDate.compareTo(book.getEndDate())==0)){
//      throw new RuntimeException("Duplicate occurred");
//     }
     
//     if (errors.isEmpty()) {
//            return true;
//        }
     
     bkingDao.createA(new Booking(rm, c, startDate, endDate));
     rm.setStatus(AvailableStatus.OCCUPIED);
     rmDao.updateA(rm);
     
     return true;
    }
    
    @Override
    public void singleRoom(String customerId) {
       Customer cc = new Customer();
       String customer = cc.getCustomerid();
       cusDao.createA(new Customer(customer, CustomerCategory.SINGLE));
    }

    @Override
    public void coupleRoom(String customerId) {
       Customer cc = new Customer();
       String customer = cc.getCustomerid();
       cusDao.createA(new Customer(customer, CustomerCategory.COUPLE)); 
    }

    @Override
    public void FamilyRoom(String customerId) {
       Customer cc = new Customer();
       String customer = cc.getCustomerid();
       cusDao.createA(new Customer(customer, CustomerCategory.FAMILY)); 
    }

    
}
