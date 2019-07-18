/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.domain.User;

/**
 *
 * @author burakzengin
 */
public interface UserService {

    public boolean login(String username, String password);

    public void save(User u);

    public void delete(User u);

    public User findByProperty(String propName, Object propValue);
}
