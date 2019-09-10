/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Reservation;

/**
 *
 * @author burakzengin
 */
public interface ReservationDAO {

    public boolean doReservation(String token, Reservation reservation);
}
