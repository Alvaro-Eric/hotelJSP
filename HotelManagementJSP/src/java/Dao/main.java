/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import org.hibernate.Session;

/**
 *
 * @author The flash
 */
public class main {
     public static void main(String[] args) {
        Session s=HibernateUtil.getSessionFactory().openSession();
    }
}
