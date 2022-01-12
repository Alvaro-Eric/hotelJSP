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
import java.util.List;

/**
 *
 * @author Alvaro
 */
public class BookingRes implements BookingInterface {
    GenericDao<Booking> bkingDao = new GenericDao<>(Booking.class);
    GenericDao<Room> rmDao = new GenericDao<>(Room.class);
    GenericDao<Customer> cusDao = new GenericDao<>(Customer.class);
    
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
     Room rm = rmDao.findById(roomId);
     Booking book = bkingDao.findBookingByRoomId(roomId);
     Customer c = cusDao.findById(customerId);
     String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); 
     if(rm == null){
       throw new RuntimeException("We Don't have this Room");
     }
     if(startDate.compareTo(endDate)>0){
        throw new RuntimeException("Invalid Dates");
     }
     if(startDate.compareTo(today)<0){
        throw new RuntimeException("Booking don't work in past days");
     }
     if(rm.getStatus()== AvailableStatus.OCCUPIED && (startDate.equals(book.getEndDate())|| startDate.equals(book.getStartDate()))){
       throw new RuntimeException("This room is Occupied");
     } 
     
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
