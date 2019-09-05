/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author burakzengin
 */
@org.springframework.stereotype.Controller
public class DashboardController {

    @RequestMapping(value = "/petSitterApply", method = RequestMethod.GET)
    public String petSitterApply(Model m, HttpServletRequest request) {
        return "petSitterApply";
    }

    @RequestMapping(value = "/petsitter", method = RequestMethod.GET)
    public String petsitter(Model m, HttpServletRequest request) {
        return "petsitter";
    }

    @RequestMapping(value = "/petsitterProfile", method = RequestMethod.GET)
    public String petsitterProfile(Model m, HttpServletRequest request) {
        return "petsitterProfile";
    }

    @RequestMapping(value = "/dashboardTemplate", method = RequestMethod.GET)
    public String dashboardTemplate(Model m, HttpServletRequest request) {
        return "dashboardTemplate";
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public String editProfile(Model m, HttpServletRequest request) {
        return "editProfile";
    }

    @RequestMapping(value = "/bookings", method = RequestMethod.GET)
    public String bookings(Model m, HttpServletRequest request) {
        return "bookings";
    }

    @RequestMapping(value = "/hotelBookings", method = RequestMethod.GET)
    public String hotelBookings(Model m, HttpServletRequest request) {
        return "hotelBookings";
    }

}
