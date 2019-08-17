/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Hotel;
import com.bookingpetz.domain.Search;
import com.bookingpetz.domain.Service;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import kong.unirest.HttpResponse;
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
@Repository("searchDAO")
public class SearchDAOImpl implements SearchDAO {

    @Override
    public List<Hotel> resultSearch(Search search) {
        HttpResponse<String> response = Unirest.post("http://localhost:8084/BookingPetsREST/webapi/calendar/getCalendarEventsByDate")
                .body(new Gson().toJson(search))
                .asString();

        System.out.println("status code : " + response.getStatus() + " body : " + response.getBody());
        List<Hotel> hotels = new ArrayList<>();
        if (response.getStatus() == 200) {
            JSONParser parser = new JSONParser();
            JSONArray jsonarray = null;
            try {
                jsonarray = (JSONArray) parser.parse(response.getBody());
            } catch (ParseException ex) {
                Logger.getLogger(SearchDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                for (int i = 0; i < jsonarray.size(); i++) {
                    JSONObject hotelObject = (JSONObject) jsonarray.get(i);
                    Hotel hotel = new Gson().fromJson(hotelObject.toString(), Hotel.class);

                    JSONArray jSONArray = (JSONArray) hotelObject.get("service");
                    List<Service> services = new ArrayList<>();
                    for (int j = 0; j < jSONArray.size(); j++) {
                        JSONObject serviceONObject = (JSONObject) jSONArray.get(j);
                        Service service = new Gson().fromJson(serviceONObject.toString(), Service.class);
                        services.add(service);
                    }
                    hotel.setServiceList(services);
                    hotels.add(hotel);
                }
            } catch (JsonSyntaxException e) {
                System.out.println(e.toString());
            }

        }
        return hotels;
    }

}
