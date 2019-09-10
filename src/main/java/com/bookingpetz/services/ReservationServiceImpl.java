/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.dao.ReservationDAO;
import com.bookingpetz.domain.Reservation;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author burakzengin
 */
@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationDAO reservationDAO;

    @Override
    public boolean doReservation(String token, Reservation reservation) {
        return reservationDAO.doReservation(token, reservation);
    }

    @Override
    public List<Reservation> getReservation(String token) {
        return reservationDAO.getReservation(token);
    }

}
