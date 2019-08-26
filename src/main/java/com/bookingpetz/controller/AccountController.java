/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.dao.UserAuthDAO;
import com.bookingpetz.domain.User;
import com.bookingpetz.domain.UserAuth;
import com.bookingpetz.domain.UserToken;
import java.io.IOException;
import java.util.Base64;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Model m, HttpServletRequest request) {

        String encodeEmail = Base64.getEncoder().encodeToString(request.getParameter("email").getBytes());
        String encodePassword = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
        UserToken userToken = userAuthDAO.login(new UserAuth(encodeEmail, encodePassword));
        if (!userToken.getUser().getUserId().equals("000")) {
            //SUCCESS
            System.out.println("Login Success " + userToken.getUser().getUserId());
            String token = userToken.getAccess_token();
            HttpSession session = request.getSession();
            session.setAttribute("token", token);
            session.setAttribute("user", userToken.getUser());
            System.out.println("Email : " + userToken.getUser().getEmail());
            return "redirect:/";
        }
        //FAILED 
        return "redirect:/";
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public String signup(Model m, HttpServletRequest request, HttpServletResponse response) throws IOException {

        String name = StringUtils.capitalize(request.getParameter("name"));
        String surname = StringUtils.capitalize(request.getParameter("surname"));
        String encodeEmail = Base64.getEncoder().encodeToString(request.getParameter("email").getBytes());
        String encodePassword = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
        if (userAuthDAO.signUp(new User(encodeEmail, name, surname, encodePassword, "false"))) {
            //SUCCESS
            return "redirect:login?email=" + encodeEmail + "&password=" + encodePassword;
        }
        //FAILED
        return "redirect:/";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        try {
            if (userAuthDAO.logout(request.getSession().getAttribute("token").toString())) {
                HttpSession session = request.getSession(false);
                session.invalidate();
            }
            return "redirect:/";
        } catch (Exception ex) {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
    public void checkUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        String result = "FAILED";
        try {
            if (userAuthDAO.checkUsername(request.getParameter("email"))) {
                result = "SUCCESS";
            }
        } catch (Exception ex) {
            System.out.println(ex.toString());
            result = "FAILED";
        }
        response.getWriter().write(result);
    }

    @RequestMapping(value = "/sendConfirmationMail", method = RequestMethod.POST)
    public String sendConfirmationMail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = StringUtils.capitalize(request.getParameter("name"));
        String surname = StringUtils.capitalize(request.getParameter("surname"));
        String encodeEmail = Base64.getEncoder().encodeToString(request.getParameter("email").getBytes());
        String encodePassword = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
        if (userAuthDAO.confirmationMail(new User(encodeEmail, name, surname, encodePassword, "false"))) {
            //SUCCESS
            return "redirect:/home?result=success";
        }
        //FAILED
        return "redirect:/";
    }

    @RequestMapping(value = "/verifymail", method = RequestMethod.GET)
    public String verifymail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String key = request.getParameter("object");
        System.out.println(key);
        if (userAuthDAO.verifyMail(key)) {
            return "redirect:/home?verify=success";
        }
        return "redirect:/home?verify=failed";
    }

    @RequestMapping(value = "/resetPasswordSendMail", method = RequestMethod.POST)
    public String resetPasswordSendMail(HttpServletRequest request) {
        String encodeEmail = Base64.getEncoder().encodeToString(request.getParameter("email").getBytes());
        if (userAuthDAO.resetPasswordSendMail(encodeEmail)) {
            //SUCCESS
            return "redirect:/home?resultPassword=success";
        }
        //FAILED
        return "redirect:/home?resultPassword=failed";
    }

    @RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
    public String resetPassword(Model m, HttpServletRequest request) throws IOException {
        String decodeCode = new String(Base64.getDecoder().decode(request.getParameter("object")));
        System.out.println("decode " + decodeCode);
        if (userAuthDAO.checkCode(decodeCode)) {
            m.addAttribute("resetPassword", "success");
            m.addAttribute("object", request.getParameter("object"));
            return "resetPassword";
        }
        System.out.println("false");
        return "redirect:/home?resultPassword=failed";
    }

    @RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
    public String resetPasswordPost(Model m, HttpServletRequest request) throws IOException {
        String code = request.getParameter("object");
        String encodePassword = Base64.getEncoder().encodeToString(request.getParameter("password").getBytes());
        if (userAuthDAO.updatePassword(code, encodePassword)) {
            return "redirect:/home?resultPassword=done";
        } else {
            return "redirect:/home?resultPassword=failed";
        }
    }
}
