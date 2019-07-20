/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.database.user;

import com.bookingpetz.dao.UserDAOImpl;
import com.bookingpetz.domain.Contact;
import com.bookingpetz.domain.User;
import com.bookingpetz.util.HibernateUtil;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author burakzengin
 */
public class saveUser {
    
    private static final AtomicLong counter = new AtomicLong(0);
    
    public static long getNextNumber() {
        return counter.incrementAndGet();
    }

    public static void main(String[] args) {

//        UserDAOImpl userDAOImpl = new UserDAOImpl();
//
//        System.out.println(userDAOImpl.findByProperty("email", "brakzengin@gmail.com").get(0).getPassword());
//
//        User u = userDAOImpl.findByProperty("email", "brakzengin@gmail.com").get(0);
//
//        System.out.println(u.getPassword());

        for (int i = 0; i < 10; i++) {
            
            System.out.println(getNextNumber());
        }

    
//
//        Session session = null;
//        Transaction transaction = null;
//        try {
//            session = HibernateUtil.getSessionFactory().openSession();
//            transaction = session.beginTransaction();
//            transaction.begin();
//
//            
//            
//            session.save(customer);
//
//            transaction.commit();
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            if (session != null) {
//                session.close();
//            }
//        }
//
//        HibernateUtil.getSessionFactory().close();
//    }
//        List<User> userList = userDAOImpl.findAll();
//        for (User user : userList) {
//            System.out.println(user.getUserId());
//            System.out.println("Successfully Found");
//        }
//        Contact contact = new Contact("ASda", "ads", "asda", "qeqeqeqqweq");
//        User user = new User("ASda", "asda", "SAdasd", "sadasd", contact);
////
//        userDAOImpl.save(user);
//        UserDAOImpl userDAOImpl = new UserDAOImpl();
//        System.out.println(userDAOImpl.findByProperty("userId", "140315002").size());
    }
}
