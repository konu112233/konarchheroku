/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Session;
import com.bookingpetz.domain.UserAuth;
import com.bookingpetz.domain.UserToken;

/**
 *
 * @author burakzengin
 */
public interface UserAuthDAO {

    public UserToken login(UserAuth userAuth);

    public boolean logout(Session session);

}
