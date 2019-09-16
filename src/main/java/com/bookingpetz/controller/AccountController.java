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
import com.google.gson.Gson;
import java.io.IOException;
import java.util.Base64;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
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

        JSONObject user = new Gson().fromJson(request.getParameter("loginInput"), JSONObject.class);
        String encodeEmail = Base64.getEncoder().encodeToString(user.get("email").toString().trim().getBytes());
        String encodePassword = Base64.getEncoder().encodeToString(user.get("password").toString().trim().getBytes());
        String url = user.get("pageUrl").toString().trim();
        if (url.length() <= 1) {
            url = "home";
        }
        UserToken userToken = userAuthDAO.login(new UserAuth(encodeEmail, encodePassword));
        if (!userToken.getUser().getUserId().equals("000")) {
            //SUCCESS
            System.out.println("Login Success " + userToken.getUser().getUserId());
            String token = userToken.getAccess_token();
            HttpSession session = request.getSession(true);
            session.setAttribute("token", token);
            session.setAttribute("user", userToken.getUser());
            session.setAttribute("partner", userToken.getUser().getPartner());
            System.out.println("Email : " + userToken.getUser().getEmail());
            return "redirect:/" + url;
        }
        //FAILED 
        return "redirect:/" + url;
    }

    @RequestMapping(value = "/getLogin", method = RequestMethod.GET)
    public String getLogin(Model m, HttpServletRequest request) {

        JSONObject user = new Gson().fromJson(request.getParameter("loginInput"), JSONObject.class);
        String encodeEmail = Base64.getEncoder().encodeToString(user.get("email").toString().trim().getBytes());
        String encodePassword = Base64.getEncoder().encodeToString(user.get("password").toString().trim().getBytes());
        String url = user.get("pageUrl").toString().trim();
        if (url.length() <= 1) {
            url = "home";
        }

        System.out.println("Heyyy : " + encodeEmail + " " + encodePassword + " " + url);
        UserToken userToken = userAuthDAO.login(new UserAuth(encodeEmail, encodePassword));
        if (!userToken.getUser().getUserId().equals("000")) {
            //SUCCESS
            System.out.println("Login Success " + userToken.getUser().getUserId());
            String token = userToken.getAccess_token();
            HttpSession session = request.getSession(true);
            session.setAttribute("token", token);
            session.setAttribute("user", userToken.getUser());
            session.setAttribute("partner", userToken.getUser().getPartner());
            System.out.println("Email : " + userToken.getUser().getEmail());
            return "redirect:/" + url;
        }
        //FAILED 
        return "redirect:/" + url;
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
        String name = StringUtils.capitalize(request.getParameter("name").trim());
        String surname = StringUtils.capitalize(request.getParameter("surname").trim());
        String encodeEmail = Base64.getEncoder().encodeToString(request.getParameter("email").trim().getBytes());
        String encodePassword = Base64.getEncoder().encodeToString(request.getParameter("password").trim().getBytes());
        String url = request.getParameter("pageUrl2").trim();
        if (url.length() <= 1) {
            url = "home";
        }
        System.out.println("URll  " + url);
        if (userAuthDAO.confirmationMail(new User(encodeEmail, name, surname, encodePassword, "false"), url).equals(url)) {
            //SUCCESS
            if (url.equals("home")) {
                return "redirect:/home?result=success";
            }
            return "redirect:/" + url + "&result=success";
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
        String encodeEmail = Base64.getEncoder().encodeToString(request.getParameter("email").trim().getBytes());
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
        String encodePassword = Base64.getEncoder().encodeToString(request.getParameter("password").trim().getBytes());
        if (userAuthDAO.updatePassword(code, encodePassword)) {
            return "redirect:/home?resultPassword=done";
        } else {
            return "redirect:/home?resultPassword=failed";
        }
    }
}
