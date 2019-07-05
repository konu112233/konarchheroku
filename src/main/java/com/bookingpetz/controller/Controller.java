/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

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
}