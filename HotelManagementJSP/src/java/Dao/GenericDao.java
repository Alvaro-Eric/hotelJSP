/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.AvailableStatus;
import Model.Booking;
import Model.Capacity;
import Model.Customer;
import Model.CustomerCategory;
import Model.Room;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author The flash
 */
public class GenericDao<A> {
    private Class<A> type; 

    public GenericDao(Class<A> type) {
        this.type = type;
    }
    
    
    public String createA(A obj) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.beginTransaction();
        s.save(obj);
        s.getTransaction().commit();
        s.close();
        return "success";
    }

    public String updateA(A obj) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.beginTransaction();
        s.update(obj);
        s.getTransaction().commit();
        s.close();
        return "success";
    }

    public String deleteA(A obj) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.beginTransaction();
        s.delete(obj);
        s.getTransaction().commit();
        s.close();
        return "success";
    }

    public List<A> findAll() {
        Session s = HibernateUtil.getSessionFactory().openSession();
        org.hibernate.Query q = s.createQuery("from "+type.getName());
        List<A> li = q.list();
        s.close();
        return li;
    }
    

    public A findById(String id) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        A obj = (A) s.get(type, id);
        s.close();
        return obj;
    }
    
    public Customer findCustomerById(String customerid){
      Session s = HibernateUtil.getSessionFactory().openSession();
      String hql="from Customer where customerid='"+customerid+"'";
      Query query=s.createQuery(hql);
      return (Customer) query.uniqueResult();
    }
    
    public Booking checkIfRoomIsOccupied(String customerid){
        Session s = HibernateUtil.getSessionFactory().openSession();
        try{
        String hql="from Booking where customerid='"+customerid+"' and status ='"+AvailableStatus.OCCUPIED+"'";
        Query query=s.createQuery(hql);
        return(Booking) query.uniqueResult();
        
      }catch(HibernateException ex){
        throw new RuntimeException(ex.getMessage());
      }finally{
        s.close();
      }
    
    }
    public Room findRoomCapacity(Capacity capacity){
        Session s = HibernateUtil.getSessionFactory().openSession();
        try{
        String hql="from room where capacity='"+capacity+"'";
        Query query=s.createQuery(hql);
        return(Room) query.uniqueResult();
        
      }catch(HibernateException ex){
        throw new RuntimeException(ex.getMessage());
      }finally{
        s.close();
      }
    }
    public Customer findCustomerCategory(CustomerCategory customerCategory){
        Session s = HibernateUtil.getSessionFactory().openSession();
        try{
            String hql = "from customer where customerCategory='"+customerCategory+"'";
            Query query=s.createQuery(hql);
            return(Customer) query.uniqueResult();
        }catch(HibernateException ex){
          throw new RuntimeException(ex.getMessage());
        }finally{
          s.close();
        }   
    }
    public Room findRoomById(String roomId){
      Session s = HibernateUtil.getSessionFactory().openSession();
      String hql="from Room where roomid='"+roomId+"'";
      Query query=s.createQuery(hql);
      return (Room) query.uniqueResult();
    }
    
    public Room findAvailableRoom(String roomId){
      Session s = HibernateUtil.getSessionFactory().openSession();
      String hql="from Room where status='"+AvailableStatus.AVAILABLE+"'";
      Query query=s.createQuery(hql);
      return (Room) query.uniqueResult();
    }
    
    public List<Booking> findAllOccupied(){
      Session s = HibernateUtil.getSessionFactory().openSession();
      String hql="from Booking where status='"+AvailableStatus.OCCUPIED+"'";
      Query query=s.createQuery(hql);
        return(List<Booking>) query.list();
    }
        
    
    public List<Booking> findAllAvailable(){
      Session s = HibernateUtil.getSessionFactory().openSession();
      String hql="from Booking where status='"+AvailableStatus.AVAILABLE+"'";
      Query query=s.createQuery(hql);
        return(List<Booking>) query.list();
    }
    
    public  Booking findBookingByRoomId(String roomId){
       Session s = HibernateUtil.getSessionFactory().openSession();
       String sql = "select * from booking where roomid = '"+roomId+"' order by id desc LIMIT 1 ";
       SQLQuery query = s.createSQLQuery(sql);
       query.addEntity(Booking.class);
       Booking booking = (Booking)query.uniqueResult();
      return booking;   
    }
    
    
    
}
