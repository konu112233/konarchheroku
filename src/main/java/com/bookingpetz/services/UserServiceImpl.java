/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.dao.UserServiceDAO;
import com.bookingpetz.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author burakzengin
 */
@Service
public class UserServiceImpl implements UserServiceDAO {

    @Autowired
    private UserServiceDAO userServiceDAO;

    @Override
    public User getByToken(String token) {
        return userServiceDAO.getByToken(token);
    }
}
