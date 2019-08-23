/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.User;
import com.bookingpetz.domain.UserAuth;
import com.bookingpetz.domain.UserToken;
import com.google.gson.Gson;
import java.util.Base64;
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("userAuthDAO")
public class UserAuthDAOImpl implements UserAuthDAO {

    @Override
    public UserToken login(UserAuth userAuth) {

        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/login")
                .header("Content-type", "application/json")
                .body(new Gson().toJson(userAuth))
                .asString();

        System.out.println("Login Status Code : " + response.getStatus() + " Body : " + response.getBody());
        return new Gson().fromJson(response.getBody(), UserToken.class);
    }

    @Override
    public boolean logout(String token) {
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/logout")
                .header("Content-type", "application/json")
                .body(new Gson().toJson(token))
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

    @Override
    public boolean checkUsername(String email) {
        String encodeEmail = Base64.getEncoder().encodeToString(email.getBytes());
        JSONObject jsono = new JSONObject();
        jsono.put("email", encodeEmail);
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/auth/checkUsername")
                .header("Content-type", "application/json")
                .body(jsono.toJSONString())
                .asString();

        System.out.println("CheckUsername Status Code : " + response.getStatus() + " body : " + response.getBody());
        if (response.getStatus() == 200) {
            return response.getBody().equals("\"SUCCESS\"");
        }
        return false;
    }

    @Override
    public boolean confirmationMail(User user) {
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/auth/confirmationMail")
                .header("Content-type", "application/json")
                .body(new Gson().toJson(user))
                .asString();

        System.out.println("ConfirmationMail Status Code : " + response.getStatus() + " body : " + response.getBody());
        if (response.getStatus() == 200) {
            return response.getBody().equals("\"SUCCESS\"");
        }
        System.out.println("ConfirmationMail failed");
        return false;
    }

    @Override
    public boolean verifyMail(String key) {

        JSONObject jsono = new JSONObject();
        jsono.put("verificationKey", key);
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/auth/verifymail")
                .header("Content-type", "application/json")
                .body(jsono.toJSONString())
                .asString();

        System.out.println("verifyMail Status Code : " + response.getStatus() + " body : " + response.getBody());
        if (response.getStatus() == 200) {
            return response.getBody().equals("\"SUCCESS\"");
        }
        System.out.println("verifyMail failed");
        return false;
    }

}
