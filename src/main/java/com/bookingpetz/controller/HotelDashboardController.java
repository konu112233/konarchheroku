/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.User;
import com.bookingpetz.services.HotelDashboardService;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
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
public class HotelDashboardController {

    @Autowired
    private HotelDashboardService hotelDashboardService;

    @RequestMapping(value = "/registerHotel", method = RequestMethod.POST)
    public String registerHotel(Model m, HttpServletRequest request) throws IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                m.addAttribute("token", session.getAttribute("token"));
                System.out.println(request.getParameter("result"));
                User user = new Gson().fromJson(request.getParameter("result"), User.class);
                System.out.println("body : " + new Gson().toJson(user));
                System.out.println("user userId : " + user.getUserId());
                if (hotelDashboardService.registerHotel(user)) {
                    return "redirect:hotelOwnerStatus";
                }
                return "redirect:hotelOwnerApply";
            } else {
                return "redirect:/";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/" + exception.fillInStackTrace().toString();
        }
    }

    @RequestMapping(value = "/hotelOwnerApply", method = RequestMethod.GET)
    public String hotelOwnerApply(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                String token = session.getAttribute("token").toString();
                m.addAttribute("user", session.getAttribute("user"));
                m.addAttribute("token", session.getAttribute("token"));
                String status = hotelDashboardService.checkStatus(token).getStatus();
                if (status.equals("Pending")) {
                    return "redirect:hotelOwnerStatus";
                } else if (status.equals("No")) {
                    return "redirect:hotelOwnerApplyFirst";
                }
                return "hotelOwnerApply";
            } else {
                return "redirect:/";
            }
        } catch (Exception exception) {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/myHotel", method = RequestMethod.GET)
    public String myHotel(Model m, HttpServletRequest request) {
        return "myHotel";
    }

    @RequestMapping(value = "/previewHotel", method = RequestMethod.GET)
    public String previewHotel(Model m, HttpServletRequest request) {
        return "previewHotel";
    }

    @RequestMapping(value = "/hotelOwnerStatus", method = RequestMethod.GET)
    public String hotelOwnerStatus(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                m.addAttribute("user", session.getAttribute("user"));
                m.addAttribute("token", session.getAttribute("token"));
                return "hotelOwnerStatus";
            } else {
                return "redirect:/";
            }
        } catch (Exception exception) {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/hotelOwnerApplyFirst", method = RequestMethod.GET)
    public String hotelOwnerApplyFirst(Model m, HttpServletRequest request) {
        return "hotelOwnerApplyFirst";
    }
}
