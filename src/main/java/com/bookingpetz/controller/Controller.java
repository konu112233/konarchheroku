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
public class Controller {

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String home(Model m) {
        m.addAttribute("page", "home");
        return "home";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about(Model m) {
        m.addAttribute("page", "about");
        return "about";
    }

    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public String blog(Model m) {
        m.addAttribute("page", "blog");
        return "blog";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contact(Model m) {
        m.addAttribute("page", "contact");
        return "contact";
    }

    @RequestMapping(value = "/searchResult", method = RequestMethod.POST)
    public String searchResult(Model m, HttpServletRequest request) {
        String petType = request.getParameter("petType");
        String where = request.getParameter("where");
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");

        System.out.println(checkin + " " + checkout + " " + where + " " + petType);

        return "redirect:searchResult";
    }

    @RequestMapping(value = "/searchResult", method = RequestMethod.GET)
    public String searchResult(Model m) {
        //m.addAttribute("page", "searchResult");
        return "searchResult";
    }

    @RequestMapping(value = "/property", method = RequestMethod.GET)
    public String property(Model m) {
        return "property";
    }

    @RequestMapping(value = "/mock", method = RequestMethod.GET)
    public String mock(Model m) {
        return "mock";
    }

    @RequestMapping(value = "/newjsp", method = RequestMethod.GET)
    public String newjsp(Model m) {
        return "newjsp";
    }
}
