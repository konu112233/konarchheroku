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
public class Controller {

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String home(Model m, HttpServletRequest request) {
        m.addAttribute("page", "home");

        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                m.addAttribute("user", session.getAttribute("user"));
                return "home";
            } else {
                return "home";
            }
        } catch (Exception exception) {
            return "home";
        }
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about(Model m, HttpServletRequest request) {
        m.addAttribute("page", "about");
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                m.addAttribute("user", "user");
                return "about";
            } else {
                return "about";
            }
        } catch (Exception exception) {
            return "about";
        }
    }

    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public String blog(Model m, HttpServletRequest request) {
        m.addAttribute("page", "blog");

        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                m.addAttribute("user", "user");
                return "blog";
            } else {
                return "blog";
            }
        } catch (Exception exception) {
            return "blog";
        }
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contact(Model m, HttpServletRequest request) {
        m.addAttribute("page", "contact");

        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                m.addAttribute("user", "user");
                return "contact";
            } else {
                return "contact";
            }
        } catch (Exception exception) {
            return "contact";
        }
    }

    @RequestMapping(value = "/property", method = RequestMethod.GET)
    public String property(Model m) {
        return "property";
    }

    @RequestMapping(value = "/myPets", method = RequestMethod.GET)
    public String myPets(Model m) {
        return "myPets";
    }

    @RequestMapping(value = "/mock", method = RequestMethod.GET)
    public String mock(Model m) {
        return "mock";
    }

}
