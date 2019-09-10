/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Reservation;
import com.google.gson.Gson;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("reservationDAO")
public class ReservationDAOImpl implements ReservationDAO {

    @Override
    public boolean doReservation(String token, Reservation reservation) {
        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/doReservation")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + token)
                .body(new Gson().toJson(reservation))
                .asJson();

        return response.getStatus() == 200;
    }

}
