/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.database.user;

import com.bookingpetz.dao.UserDAOImpl;
import com.bookingpetz.domain.Contact;
import com.bookingpetz.domain.Hotel;
import com.bookingpetz.domain.Search;
import com.bookingpetz.domain.Service;
import com.bookingpetz.domain.User;
import com.bookingpetz.services.SearchServiceImpl;
import com.bookingpetz.util.HibernateUtil;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicLong;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author burakzengin
 */
public class saveUser {

    public static void main(String[] args) throws ParseException {

//        List<Service> list = new ArrayList<Service>();
//        list.add(new Service(2, "adsa", "asdad", "sadada", 100));
//        Hotel hotel = new Hotel(2, 2, "sada", 5, list);
//        System.out.println(hotel.toJSON());

//2019-09-19T10:00:00-07:00
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd'T'HH:mm:ss");
//        formatter.setTimeZone(TimeZone.getTimeZone("UTC"));
//
//        Date date = formatter.parse("2019/10/20T08:23:43");
//        String formattedDate = formatter.format(date);
//        System.out.println(formattedDate);
//        SearchServiceImpl searchServiceImpl = new SearchServiceImpl();
//        searchServiceImpl.resultSearch(new Search("2019-09-19T10:00:00-07:00", "2019-09-18T10:00:00-07:00", "Europe/Amsterdam"));
//        UserDAOImpl userDAOImpl = new UserDAOImpl();
//
//        System.out.println(userDAOImpl.findByProperty("email", "brakzengin@gmail.com").get(0).getPassword());
//
//        User u = userDAOImpl.findByProperty("email", "brakzengin@gmail.com").get(0);
//
//        System.out.println(u.getPassword());
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
