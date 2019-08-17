/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.dao.DashboardDAO;
import com.bookingpetz.domain.Booking;
import com.bookingpetz.domain.Event;
import com.bookingpetz.domain.Hotel;
import com.bookingpetz.domain.ResultModal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author burakzengin
 */
@Service
public class DashboardServiceImpl implements DashboardService {

    @Autowired
    private DashboardDAO dashboardDAO;

    @Override
    public List<ResultModal> getHotelCalendar(String userId) {
        return dashboardDAO.getHotelCalendar(userId);
    }

    @Override
    public boolean insertEvent(Booking booking) {
        return dashboardDAO.insertEvent(booking);
    }

    @Override
    public boolean removeEvent(Event event) {
        return dashboardDAO.removeEvent(event);
    }

    @Override
    public boolean registerHotel(Hotel hotel) {
        return dashboardDAO.registerHotel(hotel);
    }

}
