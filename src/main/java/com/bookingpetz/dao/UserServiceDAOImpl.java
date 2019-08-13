/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.User;
import com.google.gson.Gson;
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("userServiceDAO")
public class UserServiceDAOImpl implements UserServiceDAO {

    @Override
    public User getByToken(String token) {

        HttpResponse<String> response = Unirest.get("http://localhost:8084/BookingPetsREST/webapi/user/getByToken")
                .header("Authorization", "Bearer " + token)
                .asString();

        if (response.getStatus() == 200) {
            return new Gson().fromJson(response.getBody(), User.class);
        }
        return new User(0);
    }

}
