/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Status;
import com.bookingpetz.domain.User;

/**
 *
 * @author burakzengin
 */
public interface HotelDashboardDAO {

    public boolean registerHotel(User user, String token);

    public Status checkStatus(String token);
}
