/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.dao;

import com.bookingpetz.domain.Search;
import com.bookingpetz.domain.SearchResult;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;
import java.lang.reflect.Type;
import com.google.gson.reflect.TypeToken;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

/**
 *
 * @author burakzengin
 */
@Repository("searchDAO")
public class SearchDAOImpl implements SearchDAO {

    @Override
    public List<SearchResult> resultSearch(Search search) {
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/calendar/searchResult")
                .body(new Gson().toJson(search))
                .asString();

        System.out.println("status code : " + response.getStatus() + " body : " + response.getBody());
        List<SearchResult> searchResults = new ArrayList<>();
        if (response.getStatus() == 200) {
            Type listType = new TypeToken<ArrayList<SearchResult>>() {
            }.getType();
            searchResults = new Gson().fromJson(response.getBody(), listType);
        }
        return searchResults;
    }
 
   @Override
    public SearchResult getProperty(String code) {
        JSONObject jsono = new JSONObject();
        jsono.put("object", code);
        HttpResponse<String> response = Unirest.post("https://bookingpetswebservice.herokuapp.com/webapi/hotel/getProperty")
                .header("Content-type", "application/json")
                .body(jsono.toJSONString())
                .asString();

        System.out.println("status code : " + response.getStatus() + " body : " + response.getBody());
        SearchResult searchResults = new SearchResult();
        if (response.getStatus() == 200) {
            searchResults = new Gson().fromJson(response.getBody(), SearchResult.class);
        }
        return searchResults;
    }
}
