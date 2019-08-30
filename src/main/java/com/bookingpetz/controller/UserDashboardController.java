/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.Pet;
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
public class UserDashboardController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/myPets", method = RequestMethod.GET)
    public String myPets(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String code = session.getAttribute("token").toString();
                m.addAttribute("pets", userService.getMyPets(code));
                return "myPets";
            } else {
                return "redirect:/?token";
            }
        } catch (Exception exception) {
            return "redirect:/?" + exception;
        }
    }

    @RequestMapping(value = "/addPet", method = RequestMethod.POST)
    public String addPet(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                Pet pet = new Gson().fromJson(request.getParameter("result"), Pet.class);
                if (userService.addPet(pet, session.getAttribute("token").toString())) {
                    return "redirect:myPets?success";
                }
                return "redirect:myPets";
            } else {
                return "redirect:/";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/?" + exception;
        }
    }

    @RequestMapping(value = "/removePet", method = RequestMethod.POST)
    public String removePet(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                if (userService.removePet(request.getParameter("petId"), session.getAttribute("token").toString())) {
                    return "redirect:myPets?success";
                }
                return "redirect:myPets";
            } else {
                return "redirect:/";
            }
        } catch (JsonSyntaxException exception) {
            return "redirect:/?" + exception;
        }
    }
}
