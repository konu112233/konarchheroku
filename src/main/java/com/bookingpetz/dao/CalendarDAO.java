/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Booking;
import com.bookingpetz.domain.Event;
import com.bookingpetz.domain.ResultModal;
import java.util.List;

/**
 *
 * @author burakzengin
 */
public interface CalendarDAO {

    public List<ResultModal> getHotelCalendar(String userId);

    public boolean insertEvent(Booking booking);

    public boolean removeEvent(Event event);
}
