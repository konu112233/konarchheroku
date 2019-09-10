/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.services;

import com.bookingpetz.domain.Reservation;
import java.util.List;

/**
 *
 * @author burakzengin
 */
public interface ReservationService {

    public boolean doReservation(String token, Reservation reservation);

    public List<Reservation> getReservation(String token);
}
