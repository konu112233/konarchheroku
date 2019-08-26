/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Status;
import com.bookingpetz.domain.User;
import com.google.gson.Gson;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("hotelDashboardDAO")
public class HotelDashboardDAOImpl implements HotelDashboardDAO {

    @Override
    public boolean registerHotel(User user, String token) {

        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/registerHotel")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + token)
                .body(new Gson().toJson(user))
                .asJson();

        return response.getStatus() == 200;
    }

    @Override
    public Status checkStatus(String token) {

        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/status")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + token)
                .asJson();

        if (response.getStatus() == 200) {
            return new Gson().fromJson(response.getBody().toString(), Status.class);
        }
        return new Status("false", "false");
    }
}
