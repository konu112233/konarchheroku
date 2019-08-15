/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.dao.UserAuthDAO;
import com.bookingpetz.dao.UserServiceDAO;
import com.bookingpetz.domain.Session;
import com.bookingpetz.domain.User;
import com.bookingpetz.domain.UserAuth;
import com.bookingpetz.domain.UserToken;
import java.util.Base64;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author burakzengin
 */
@org.springframework.stereotype.Controller
public class AccountController {

    @Autowired
    private UserAuthDAO userAuthDAO;

    @Autowired
    private UserServiceDAO userServiceDAO;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Model m, HttpServletRequest request) {

        String encodeEmail = Base64.getEncoder().encodeToString(request.getParameter("email").getBytes());
        String encodePassword = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
        UserToken userToken = userAuthDAO.login(new UserAuth(encodeEmail, encodePassword));
        if (userToken.getId().equals("000")) {
            //SUCCESS
            System.out.println("success " + userToken.getId());
            Session sesssionObj = new Session(userToken.getAccess_token(), userServiceDAO.getByToken(userToken.getAccess_token()));
            HttpSession session = request.getSession();
            session.setAttribute("user", sesssionObj);
            return "redirect:/";
        }
        //FAILED 
        return "redirect:/";
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public String signup(Model m, HttpServletRequest request) {

        String name = StringUtils.capitalize(request.getParameter("name"));
        String surname = StringUtils.capitalize(request.getParameter("surname"));
        String encodeEmail = Base64.getEncoder().encodeToString(request.getParameter("email").getBytes());
        String encodePassword = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
        if (userAuthDAO.signUp(new User(encodeEmail, encodePassword, name, surname, ""))) {
            return "redirect:login?email=" + request.getParameter("email") + "&password=" + request.getParameter("password");
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        try {
            if (userAuthDAO.logout((Session) request.getSession().getAttribute("user"))) {
                HttpSession session = request.getSession(false);
                session.invalidate();
            }
            return "redirect:/";
        } catch (Exception ex) {
            return "redirect:/";
        }
    }
}
