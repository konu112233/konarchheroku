/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.Hotel;
import com.bookingpetz.domain.Search;
import com.bookingpetz.services.SearchService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
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
    public String searchResult(Model m, HttpServletRequest request) throws ParseException {
        String petType = request.getParameter("petType");
        String where = request.getParameter("where");
        String checkin = request.getParameter("checkin") + "T13:00:00-01:00";
        String checkout = request.getParameter("checkout") + "T10:00:00-01:00";

        DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy'T'HH:mm:ss-HH:mm");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss-HH:mm");
        Date date = sdf.parse(checkin);
        checkin = simpleDateFormat.format(date);
        date = sdf.parse(checkout);
        checkout = simpleDateFormat.format(date);

        System.out.println("timeMin : " + checkin + " TimeMax : " + checkout + " " + where + " " + petType);

        return "redirect:searchResult?checkin=" + checkin + "&checkout=" + checkout + "&where=" + where;
    }

    @RequestMapping(value = "/searchResult", method = RequestMethod.GET)
    public String searchResult(Model m, @PathParam("checkin") String checkin, @PathParam("checkout") String checkout, @PathParam("where") String where) {
        System.out.println(checkin + " " + checkout + " " + where);
        try {
            List<Hotel> hotels = searchService.resultSearch(new Search(checkout, checkin, "Europe/Amsterdam"));
            m.addAttribute("hotels", hotels);
        } catch (Exception e) {
            return "redirect:home?error";
        }

        return "searchResult";
    }
}
