/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Booking;
import Model.CustomerCategory;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Alvaro
 */
public interface BookingInterface {
   public void availableRoom(String roomId);
   public boolean occupiedRoom(String customerId,String roomId,String startDate,String endDate);
   public void singleRoom(String customerId);
   public void coupleRoom(String customerId);
   public void FamilyRoom(String customerId);
}
