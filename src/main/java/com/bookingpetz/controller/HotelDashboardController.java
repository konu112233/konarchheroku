/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.Status;
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
            if (session.getAttribute("token") != null) {

                User user = new Gson().fromJson(request.getParameter("result"), User.class);
                System.out.println("body : " + new Gson().toJson(user));
                if (hotelDashboardService.registerHotel(user, session.getAttribute("token").toString())) {
                    return "redirect:hotelOwnerStatus";
                }
                return "redirect:hotelOwnerApply";
            } else {
                return "redirect:/";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/" + exception;
        }
    }

    @RequestMapping(value = "/updateHotel", method = RequestMethod.POST)
    public String updateHotel(Model m, HttpServletRequest request) throws IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                User user = new Gson().fromJson(request.getParameter("result"), User.class);
                System.out.println("body : " + new Gson().toJson(user));
                if (hotelDashboardService.updateHotel(user, session.getAttribute("token").toString())) {
                    return "redirect:myHotel?succes";
                }
                return "redirect:myHotel";
            } else {
                return "redirect:/";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/" + exception;
        }
    }

    @RequestMapping(value = "/hotelOwner", method = RequestMethod.GET)
    public String hotelOwner(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String token = (String) session.getAttribute("token");

                Status status = hotelDashboardService.checkStatus(token);
                if (status.getPartner().equals("hotel")) {
                    switch (status.getStatus()) {
                        case "OK":
                            return "redirect:myHotel";
                        case "Pending":
                            return "redirect:hotelOwnerStatus";
                        case "NOT":
                            return "redirect:hotelOwnerApplyFirst";
                        default:
                            return "redirect:/";
                    }
                } else {
                    return "redirect:hotelOwnerApplyFirst";
                }
            } else {
                return "redirect:/?token";
            }
        } catch (Exception exception) {
            return "redirect:/?" + exception;
        }
    }

    @RequestMapping(value = "/myHotel", method = RequestMethod.GET)
    public String myHotel(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String code = session.getAttribute("token").toString();
                m.addAttribute("token", code);
                m.addAttribute("user", hotelDashboardService.getHotelInformation(code));
                return "myHotel";
            } else {
                return "redirect:/?token";
            }
        } catch (Exception exception) {
            return "redirect:/?" + exception;
        }
    }

    @RequestMapping(value = "/hotelOwnerStatus", method = RequestMethod.GET)
    public String hotelOwnerStatus(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                return "hotelOwnerStatus";
            } else {
                return "redirect:/?token";
            }
        } catch (Exception exception) {
            return "redirect:/" + exception;
        }
    }

    @RequestMapping(value = "/hotelOwnerApplyFirst", method = RequestMethod.GET)
    public String hotelOwnerApplyFirst(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                return "hotelOwnerApplyFirst";
            } else {
                return "redirect:/?token";
            }
        } catch (Exception exception) {
            return "redirect:/?" + exception;
        }
    }

    @RequestMapping(value = "/hotelOwnerApply", method = RequestMethod.GET)
    public String hotelOwnerApply(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                return "hotelOwnerApply";
            } else {
                return "redirect:/";
            }
        } catch (Exception exception) {
            return "redirect:/" + exception;
        }
    }

    @RequestMapping(value = "/previewHotel", method = RequestMethod.GET)
    public String previewHotel(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String code = session.getAttribute("token").toString();
                m.addAttribute("hotel", hotelDashboardService.getMyHotelPreview(code));
                return "property";
            } else {
                return "redirect:/?token";
            }
        } catch (Exception exception) {
            return "redirect:/?" + exception;
        }
    }

}
