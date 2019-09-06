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
import kong.unirest.JsonNode;
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
        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/login")
                .header("Content-type", "application/json")
                .body(new Gson().toJson(userAuth))
                .asJson();

        System.out.println("Login Status Code : " + response.getStatus() + " Body : " + response.getBody());
        return new Gson().fromJson(response.getBody().toString(), UserToken.class);
    }

    @Override
    public boolean logout(String token) {
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/logout")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + token)
                .asString();

        System.out.println("Logout Status Code : " + response.getStatus() + " body : " + response.getBody());
        return response.getStatus() == 200;
    }

    @Override
    public boolean checkUsername(String email) {
        String encodeEmail = Base64.getEncoder().encodeToString(email.getBytes());
        JSONObject jsono = new JSONObject();
        jsono.put("email", encodeEmail);
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/checkUsername")
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
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/confirmationMail")
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
        jsono.put("object", key);
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/verifymail")
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

    @Override
    public boolean resetPasswordSendMail(String email) {
        JSONObject jsono = new JSONObject();
        jsono.put("object", email);
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/resetPasswordSendMail")
                .header("Content-type", "application/json")
                .body(jsono.toJSONString())
                .asString();

        System.out.println("resetPasswordSendMail Status Code : " + response.getStatus() + " body : " + response.getBody());
        if (response.getStatus() == 200) {
            return response.getBody().equals("\"SUCCESS\"");
        }
        System.out.println("resetPasswordSendMail failed");
        return false;
    }

    @Override
    public boolean checkCode(String code) {
        return (System.currentTimeMillis() - Long.parseLong(code.split("-code-")[1])) / 1000 <= 60 * 60 * 24;
    }

    @Override
    public boolean updatePassword(String code, String password) {
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/updatePassword")
                .header("Content-type", "application/json")
                .body(new Gson().toJson(new UserAuth(code, password)))
                .asString();

        System.out.println("updatePassword Status Code : " + response.getStatus() + " body : " + response.getBody());
        if (response.getStatus() == 200) {
            return response.getBody().equals("\"SUCCESS\"");
        }
        System.out.println("updatePassword failed");
        return false;
    }

}
