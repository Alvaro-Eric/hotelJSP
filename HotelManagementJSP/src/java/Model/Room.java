/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;


/**
 *
 * @author Alvaro
 */
@Entity
public class Room implements Serializable{
    @Id
    private String roomid;
    private int beds;
    private boolean available;
    @Enumerated(EnumType.STRING)
    private Capacity capacity;
    private long price;
    @Enumerated(EnumType.STRING)
    private AvailableStatus status;

    public Room() {
    }

    public Room(String roomid, int beds, boolean available, Capacity capacity, long price, AvailableStatus status) {
        this.roomid = roomid;
        this.beds = beds;
        this.available = available;
        this.capacity = capacity;
        this.price = price;
        this.status = status;
    }

    public Room(String roomid, int beds, Capacity capacity, long price, AvailableStatus status) {
        this.roomid = roomid;
        this.beds = beds;
        this.capacity = capacity;
        this.price = price;
        this.status = status;
    }
    

    

    public Room(String roomid) {
        this.roomid = roomid;
    }

    public String getRoomid() {
        return roomid;
    }

    public void setRoomid(String roomid) {
        this.roomid = roomid;
    }

    public int getBeds() {
        return beds;
    }

    public void setBeds(int beds) {
        this.beds = beds;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public Capacity getCapacity() {
        return capacity;
    }

    public void setCapacity(Capacity capacity) {
        this.capacity = capacity;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public AvailableStatus getStatus() {
        return status;
    }

    public void setStatus(AvailableStatus status) {
        this.status = status;
    }

    

    
 
    
}
