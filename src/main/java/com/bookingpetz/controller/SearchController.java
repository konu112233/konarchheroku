/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.Hotel;
import com.bookingpetz.domain.Search;
import com.bookingpetz.services.SearchService;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/searchResult", method = RequestMethod.POST)
    public String searchResult(Model m, HttpServletRequest request) throws ParseException, IOException {
        String petType = request.getParameter("petType");
        String location = request.getParameter("location");
        String checkin = request.getParameter("checkin") + "T13:00:00-01:00";
        String checkout = request.getParameter("checkout") + "T10:00:00-01:00";

        DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy'T'HH:mm:ss-HH:mm");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss-HH:mm");
        Date date = sdf.parse(checkin);
        checkin = simpleDateFormat.format(date);
        date = sdf.parse(checkout);
        checkout = simpleDateFormat.format(date);

        System.out.println("checkin : " + request.getParameter("checkin") + " checkout : " + request.getParameter("checkout") + " location : " + location + " petType : " + petType);

        try {
            List<Hotel> hotels = searchService.resultSearch(new Search(checkout, checkin, "Europe/Amsterdam", petType, location));
            m.addAttribute("hotels", hotels);
            m.addAttribute("petType", petType);
            m.addAttribute("search", new Search(request.getParameter("checkout"), request.getParameter("checkin"), "Europe/Amsterdam", petType, location));
            return "searchResult";
        } catch (Exception e) {
            return "redirect:home?error";
        }
    }
    
}
