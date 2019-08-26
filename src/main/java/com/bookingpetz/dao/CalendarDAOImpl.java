/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Booking;
import com.bookingpetz.domain.Event;
import com.bookingpetz.domain.ResultModal;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("calendarDAO")
public class CalendarDAOImpl implements CalendarDAO {

    @Override
    public List<ResultModal> getHotelCalendar(String token) {
        HttpResponse<JsonNode> response = Unirest.post("https://bookingpets.herokuapp.com/webapi/gateway/auth/getHotelCalendar")
                .header("Authorization", "Bearer " + token)
                .asJson();

        System.out.println("status code : " + response.getStatus() + " body : " + response.getBody());
        List<ResultModal> resultModals = new ArrayList<>();
        if (response.getStatus() == 200) {
            JSONParser parser = new JSONParser();
            JSONArray jsonarray = null;
            try {
                jsonarray = (JSONArray) parser.parse(response.getBody().toString());
            } catch (ParseException ex) {
                Logger.getLogger(SearchDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                for (int i = 0; i < jsonarray.size(); i++) {
                    JSONObject bookingObject = (JSONObject) jsonarray.get(i);
                    ResultModal resultModal = new Gson().fromJson(bookingObject.toString(), ResultModal.class);
                    resultModals.add(resultModal);
                }
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            }
        }
        return resultModals;
    }

    @Override
    public boolean insertEvent(String token, Booking booking) {

        HttpResponse<JsonNode> response = Unirest.post("https://bookingpets.herokuapp.com/webapi/gateway/auth/insertEvent")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + token)
                .body(new Gson().toJson(booking))
                .asJson();

        return response.getStatus() == 200;
    }

    @Override
    public boolean removeEvent(String token, Event event) {

        HttpResponse<JsonNode> response = Unirest.post("https://bookingpets.herokuapp.com/webapi/gateway/auth/removeEvent")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + token)
                .body(new Gson().toJson(event))
                .asJson();

        return response.getStatus() == 200;
    }
}
