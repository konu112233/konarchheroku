/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.dao.UserDAO;
import com.bookingpetz.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author burakzengin
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public void save(User u) {
        userDAO.save(u);
    }

    @Override
    public boolean login(String email, String password) {
        System.out.println(email + " " + password);
        User user = userDAO.findByProperty("email", email).get(0);
        return user.getPassword().equals(password);
    }

    @Override
    public User findByProperty(String propName, Object propValue) {
        return userDAO.findByProperty(propName, propValue).get(0);
    }

    @Override
    public void delete(User u) {
        userDAO.delete(u);
    }

}
