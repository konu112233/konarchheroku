/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.services.UserService;
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
public class ProfileController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(Model m, HttpServletRequest request) {

        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                m.addAttribute("user", userService.getProfile(session.getAttribute("token").toString()));
                return "profile";
            } else {
                return "redirect:/";
            }
        } catch (Exception exception) {
            return "redirect:/" + exception;
        }
    }
}
