/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.Contact;
import com.bookingpetz.domain.User;
import com.bookingpetz.services.UserService;
import java.util.Random;
import java.util.concurrent.atomic.AtomicLong;
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
public class AccountController {

    @Autowired
    private UserService userService;

    public static int generateRandomIntIntRange(int min, int max) {
        Random r = new Random();
        return r.nextInt((max - min) + 1) + min;
    }

    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public String signin(Model m, HttpServletRequest request) {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        //System.out.println(email + " " + password);
//        if (userService.login(username, DigestUtils.md5Hex(request.getParameter("password")))) {
        if (userService.login(email, password)) {
            //SUCCESS
            System.out.println("success");
            HttpSession session = request.getSession();
            session.setAttribute("user", userService.findByProperty("email", email));
            session.setMaxInactiveInterval(30);
            return "redirect:/";
        }
        //FAILED 
        return "redirect:/";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signup(Model m, HttpServletRequest request) {

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        int userId = (int) generateRandomIntIntRange(0, 10000);
        User u = new User(userId, email, password, name, surname, new Contact(userId, "", "", ""));
        userService.save(u);

        HttpSession session = request.getSession();
        session.setAttribute("user", u);
        session.setMaxInactiveInterval(30);
        return "redirect:/";

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            session.invalidate();
            return "redirect:/";
        } catch (Exception ex) {
            return "redirect:/";
        }
    }
}
