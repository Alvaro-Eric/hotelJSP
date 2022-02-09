/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Alvaro
 */
public class AccountDao<O> {
    SessionFactory sf= HibernateUtil.getSessionFactory();
    Session session=null;
    
    private final Class<O> type;
    
    public AccountDao(Class<O> type) {
        this.type = type;
    }
    
    public O getAccount(String email, String password) {
        String className = type.getCanonicalName().substring(type.getCanonicalName().lastIndexOf(".")+1);
        session = sf.openSession();
        Query query = session.createQuery("FROM "+ className +" where email='"+email+"' and password='"+password+"'" );
        O account = (O) query.uniqueResult();
        session.close();
        return account;
    }
}
