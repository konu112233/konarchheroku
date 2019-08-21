/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Session;
import com.google.gson.Gson;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("userServiceDAO")
public class UserServiceDAOImpl implements UserServiceDAO {

    @Override
    public Session getByToken(String token) {

        HttpResponse<JsonNode> response = Unirest.get("https://bookingpetswebservice.herokuapp.com/webapi/user/getByToken")
                .header("Authorization", "Bearer " + token)
                .asJson();
        if (response.getStatus() == 200) {
            return new Gson().fromJson(response.getBody().toString(), Session.class);
        }
        return new Session("000");
    }

}
