/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.Pet;
import com.bookingpetz.domain.Reservation;
import com.bookingpetz.services.ReservationService;
import com.bookingpetz.services.UserService;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
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
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    public String addPet(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String code = session.getAttribute("token").toString();
                Reservation reservation = new Gson().fromJson(request.getParameter("result"), Reservation.class);
                if (reservationService.doReservation(code, reservation)) {
                    return "redirect:bookings";
                }
                return "redirect:home?failed";
            } else {
                return "redirect:/";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/?" + exception;
        }
    }

    @RequestMapping(value = "/bookings", method = RequestMethod.GET)
    public String bookings(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                m.addAttribute("reservationList", reservationService.getReservation(session.getAttribute("token").toString()));
                return "bookings";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/?" + exception;
        }
        return "redirect:/?";
    }

    @RequestMapping(value = "/hotelBookings", method = RequestMethod.GET)
    public String hotelBookings(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                m.addAttribute("reservationList", reservationService.getReservation(session.getAttribute("token").toString()));
                return "hotelBookings";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/?" + exception;
        }
        return "redirect:/?";
    }

    @RequestMapping(value = "/addPetQuick", method = RequestMethod.POST)
    public String addPetQuick(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String token = session.getAttribute("token").toString();
                Pet pet = new Gson().fromJson(request.getParameter("addPetQuick"), Pet.class);
                String hotelId = request.getParameter("hotelIdInput");
                if (userService.addPet(pet, token)) {
                    return "redirect:property?object=" + hotelId;
                }
                return "redirect:property?object=" + hotelId;
            } else {
                return "redirect:/";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/?" + exception;
        }
    }
}
