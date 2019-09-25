/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Pet;
import com.bookingpetz.domain.Profile;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("userServiceDAO")
public class UserServiceDAOImpl implements UserServiceDAO {

    @Override
    public List<Pet> getMyPets(String code) {
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/getMyPets")
                .header("Authorization", "Bearer " + code)
                .asString();

        List<Pet> petList = new ArrayList<>();
        if (response.getStatus() == 200) {
            Type listType = new TypeToken<ArrayList<Pet>>() {
            }.getType();
            petList = new Gson().fromJson(response.getBody(), listType);
            return petList;
        }
        return petList;
    }

    @Override
    public boolean addPet(Pet pet, String code) {
        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/addPet")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + code)
                .body(new Gson().toJson(pet))
                .asJson();

        return response.getStatus() == 200;
    }

    @Override
    public boolean updatePet(Pet pet, String code) {
        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/updatePet")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + code)
                .body(new Gson().toJson(pet))
                .asJson();

        return response.getStatus() == 200;
    }

    @Override
    public boolean removePet(String petId, String code) {
        JSONObject jsono = new JSONObject();
        jsono.put("object", petId);
        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/removePet")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + code)
                .body(jsono.toJSONString())
                .asJson();

        return response.getStatus() == 200;
    }

    @Override
    public Profile getProfile(String code) {
        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/getProfile")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + code)
                .asJson();

        if (response.getStatus() == 200) {
            return new Gson().fromJson(response.getBody().toString(), Profile.class);
        }
        return new Profile();
    }

    @Override
    public boolean updateProfile(Profile profile, String code) {
        System.out.println("Gsonn : " + new Gson().toJson(profile));
        HttpResponse<JsonNode> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/gateway/auth/updateProfile")
                .header("Content-type", "application/json")
                .header("Authorization", "Bearer " + code)
                .body(new Gson().toJson(profile))
                .asJson();

        return response.getStatus() == 200;
    }

}
