/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.controller;

import com.bookingpetz.domain.Booking;
import com.bookingpetz.domain.End;
import com.bookingpetz.domain.Event;
import com.bookingpetz.domain.ResultModal;
import com.bookingpetz.domain.Start;
import com.bookingpetz.services.DashboardService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

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

    @RequestMapping(value = "/petsitter", method = RequestMethod.GET)
    public String petsitter(Model m, HttpServletRequest request) {
        return "petsitter";
    }

    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String calendar(Model m, HttpServletRequest request) {
//        try {
//            HttpSession session = request.getSession(false);
//            if (session.getAttribute("user") != null) {
//                m.addAttribute("user", session.getAttribute("user"));
//                User user = (User) session.getAttribute("user");
        List<ResultModal> resultModals = dashboardService.getHotelCalendar(10);
        m.addAttribute("resultModals", resultModals);
//        System.out.println(dashboardService.insertEvent(10, new Booking()));
        return "calendar";
//            } else {
//                return "redirect:/";
//            }
//        } catch (Exception exception) {
//            return "redirect:/";
//        }
    }

    @RequestMapping(value = "/calendarInsert", method = RequestMethod.POST)
    public String insertEvent(Model m, HttpServletRequest request) throws ParseException {
        String userId = request.getParameter("summary");
        String type = request.getParameter("type");
        String endTime = request.getParameter("endTime");
        String startTime = request.getParameter("startTime");
        String startDate = request.getParameter("startDate") + "T" + startTime + "-01:00";
        String endDate = request.getParameter("endDate") + "T" + endTime + "-01:00";
        String descr = request.getParameter("descr");

        DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy'T'HH:mm:ss-HH:mm");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss-HH:mm");
        Date date = sdf.parse(startDate);
        startDate = simpleDateFormat.format(date);
        date = sdf.parse(endDate);
        endDate = simpleDateFormat.format(date);

        Booking booking = new Booking(new End(endDate, "Europe/Amsterdam"), new Start(startDate, "Europe/Amsterdam"), userId, type, descr);
        boolean result = dashboardService.insertEvent(booking);
        return "redirect:calendar?" + result;
    }

    @RequestMapping(value = "/removeEvent", method = RequestMethod.POST)
    public String removeEvent(Model m, HttpServletRequest request) throws ParseException {
        String eventId = request.getParameter("eventId");
        boolean result = dashboardService.removeEvent(new Event(eventId));
        return "redirect:calendar?" + result;
    }

}
