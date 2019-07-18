/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author burakzengin
 */
@org.springframework.stereotype.Controller
public class DashboardController {

    @RequestMapping(value = "/dashboardTemplate", method = RequestMethod.GET)
    public String dashboardTemplate(Model m, HttpServletRequest request) {

        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                m.addAttribute("user", session.getAttribute("user"));
                return "dashboardTemplate";
            } else {
                return "redirect:/";
            }
        } catch (Exception exception) {
            return "redirect:/";
        }
    }

}
