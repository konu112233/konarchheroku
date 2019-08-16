/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Session;
import com.bookingpetz.domain.User;
import com.bookingpetz.domain.UserAuth;
import com.bookingpetz.domain.UserToken;
import com.google.gson.Gson;
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("userAuthDAO")
public class UserAuthDAOImpl implements UserAuthDAO {

    @Override
    public UserToken login(UserAuth userAuth) {

        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/auth/login")
                .header("Content-type", "application/json")
                .body(new Gson().toJson(userAuth))
                .asString();

        System.out.println("Login Status Code : " + response.getStatus() + " Body : " + response.getBody());
        return new Gson().fromJson(response.getBody(), UserToken.class);
    }

    @Override
    public boolean logout(Session session) {
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/auth/logout")
                .header("Content-type", "application/json")
                .body(new Gson().toJson(session))
                .asString();

        System.out.println("Logout Status Code : " + response.getStatus() + " body : " + response.getBody());
        return response.getStatus() == 200;
    }

    @Override
    public boolean signUp(User user) {
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/auth/signUp")
                .header("Content-type", "application/json")
                .body(new Gson().toJson(user))
                .asString();

        System.out.println("SignUp Status Code : " + response.getStatus() + " body : " + response.getBody());
        return response.getStatus() == 200;
    }

}
