/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;


/**
 *
 * @author Alvaro
 */
@Entity
public class Order implements Serializable{
    @Id
    private String id;
    @OneToOne
    @JoinColumn(name = "ServerId")
    private Server severid;
    @ManyToOne
    @JoinColumn(name = "CustomerId")
    private Customer customer;
    private List<Food> foods;
    private List<Drink> drinks;

    public Order(String id, Server severid, Customer customer, List<Food> foods, List<Drink> drinks) {
        this.id = id;
        this.severid = severid;
        this.customer = customer;
        this.foods = foods;
        this.drinks = drinks;
    }

    public Order() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Server getSeverid() {
        return severid;
    }

    public void setSeverid(Server severid) {
        this.severid = severid;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<Food> getFoods() {
        return foods;
    }

    public void setFoods(List<Food> foods) {
        this.foods = foods;
    }

    public List<Drink> getDrinks() {
        return drinks;
    }

    public void setDrinks(List<Drink> drinks) {
        this.drinks = drinks;
    }
    
    
}
