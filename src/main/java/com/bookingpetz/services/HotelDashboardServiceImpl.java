/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.dao.HotelDashboardDAO;
import com.bookingpetz.domain.SearchResult;
import com.bookingpetz.domain.Status;
import com.bookingpetz.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author burakzengin
 */
@Service
public class HotelDashboardServiceImpl implements HotelDashboardService {

    @Autowired
    private HotelDashboardDAO hotelDashboardDAO;

    @Override
    public boolean registerHotel(User user, String token) {
        return hotelDashboardDAO.registerHotel(user, token);
    }

    @Override
    public Status checkStatus(String token) {
        return hotelDashboardDAO.checkStatus(token);
    }

    @Override
    public SearchResult getMyHotelPreview(String code) {
        return hotelDashboardDAO.getMyHotelPreview(code);
    }

    @Override
    public User getHotelInformation(String code) {
        return hotelDashboardDAO.getHotelInformation(code);
    }

}
