/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.Search;
import com.bookingpetz.domain.SearchResult;
import com.bookingpetz.services.SearchService;
import com.bookingpetz.services.UserService;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author burakzengin
 */
@org.springframework.stereotype.Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/searchResult", method = RequestMethod.GET)
    public String searchResult(Model m, HttpServletRequest request) throws ParseException, IOException {
        Search search = new Gson().fromJson(request.getParameter("result"), Search.class);
        search.setTimeMin(search.getTimeMin() + "T13:00:00-01:00");
        search.setTimeMax(search.getTimeMax() + "T10:00:00-01:00");

        DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy'T'HH:mm:ss-HH:mm");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss-HH:mm");
        Date date = sdf.parse(search.getTimeMin());
        search.setTimeMin(simpleDateFormat.format(date));
        date = sdf.parse(search.getTimeMax());
        search.setTimeMax(simpleDateFormat.format(date));

        try {
            List<SearchResult> hotels = searchService.resultSearch(new Search(search.getTimeMax(), search.getTimeMin(), "Europe/Amsterdam", search.getPetType(), search.getLocation()));
            if (!hotels.isEmpty()) {
                m.addAttribute("hotels", hotels);
                m.addAttribute("petType", search.getPetType());
                m.addAttribute("search", new Search(search.getTimeMax(), search.getTimeMin(), "Europe/Amsterdam", search.getPetType(), search.getLocation()));
                return "searchResult";
            }
            return "redirect:home?error";
        } catch (Exception e) {
            return "redirect:home?error";
        }
    }

    @RequestMapping(value = "/property", method = RequestMethod.GET)
    public String property(Model m, HttpServletRequest request) {
        String code = request.getParameter("object");
        m.addAttribute("result", request.getParameter("result"));
        m.addAttribute("hotel", searchService.getProperty(code));
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String token = session.getAttribute("token").toString();
                m.addAttribute("petList", userService.getMyPets(token));
                m.addAttribute("userInfo", userService.getProfile(token));
                m.addAttribute("online", "1");
            } else {
                m.addAttribute("online", "0");
            }
            System.out.println("token var mi " + session.getAttribute("token").toString());
        } catch (Exception exception) {
            System.out.println(exception);
        }
        return "property";
    }

}
