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
import com.bookingpetz.services.CalendarService;

/**
 *
 * @author burakzengin
 */
@org.springframework.stereotype.Controller
public class DashboardController {

    @Autowired
    private CalendarService calendarService;

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(Model m, HttpServletRequest request) {

        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("user") != null) {
                m.addAttribute("user", session.getAttribute("user"));
                return "profile";
            } else {
                return "redirect:/";
            }
        } catch (Exception exception) {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "/petSitterApply", method = RequestMethod.GET)
    public String petSitterApply(Model m, HttpServletRequest request) {
        return "petSitterApply";
    }

    @RequestMapping(value = "/petsitter", method = RequestMethod.GET)
    public String petsitter(Model m, HttpServletRequest request) {
        return "petsitter";
    }

    @RequestMapping(value = "/petsitterProfile", method = RequestMethod.GET)
    public String petsitterProfile(Model m, HttpServletRequest request) {
        return "petsitterProfile";
    }

    @RequestMapping(value = "/myPets", method = RequestMethod.GET)
    public String myPets(Model m, HttpServletRequest request) {
        return "myPets";
    }

    @RequestMapping(value = "/dashboardTemplate", method = RequestMethod.GET)
    public String dashboardTemplate(Model m, HttpServletRequest request) {
        return "dashboardTemplate";
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public String editProfile(Model m, HttpServletRequest request) {
        return "editProfile";
    }

    @RequestMapping(value = "/bookings", method = RequestMethod.GET)
    public String bookings(Model m, HttpServletRequest request) {
        return "bookings";
    }

    @RequestMapping(value = "/hotelBookings", method = RequestMethod.GET)
    public String hotelBookings(Model m, HttpServletRequest request) {
        return "hotelBookings";
    }

    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String calendar(Model m, HttpServletRequest request) {
//        try {
//            HttpSession session = request.getSession(false);
//            if (session.getAttribute("user") != null) {
//                m.addAttribute("user", session.getAttribute("user"));
//                User user = (User) session.getAttribute("user");
        List<ResultModal> resultModals = calendarService.getHotelCalendar("9");
        System.out.println("sizeee: " + resultModals.size());
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
        boolean result = calendarService.insertEvent(booking);
        return "redirect:calendar?" + result;
    }

    @RequestMapping(value = "/removeEvent", method = RequestMethod.POST)
    public String removeEvent(Model m, HttpServletRequest request) throws ParseException {
        String eventId = request.getParameter("eventId");
        boolean result = calendarService.removeEvent(new Event(eventId));
        return "redirect:calendar?" + result;
    }

}
