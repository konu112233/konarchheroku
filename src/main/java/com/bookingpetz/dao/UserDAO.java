/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.User;
import java.util.List;

/**
 *
 * @author burakzengin
 */
public interface UserDAO {

    public void save(User u);

    public void update(User u);

    public void delete(User u);

    public User findById(Integer userId);

    public List<User> findAll();

    public List<User> findByProperty(String propName, Object propValue);
}
