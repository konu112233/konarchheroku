/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.domain.Booking;
import com.bookingpetz.domain.Event;
import com.bookingpetz.domain.ResultModal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bookingpetz.dao.CalendarDAO;

/**
 *
 * @author burakzengin
 */
@Service
public class CalendarServiceImpl implements CalendarService {

    @Autowired
    private CalendarDAO calendarDAO;

    @Override
    public List<ResultModal> getHotelCalendar(String userId) {
        return calendarDAO.getHotelCalendar(userId);
    }

    @Override
    public boolean insertEvent(String token, Booking booking) {
        return calendarDAO.insertEvent(token, booking);
    }

    @Override
    public boolean removeEvent(String token, Event event) {
        return calendarDAO.removeEvent(token, event);
    }
}
