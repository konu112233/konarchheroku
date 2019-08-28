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
import com.bookingpetz.services.CalendarService;
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
public class CalendarController {

    @Autowired
    private CalendarService calendarService;

    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String calendar(Model m, HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String token = (String) session.getAttribute("token");
                List<ResultModal> resultModals = calendarService.getHotelCalendar(token);
                m.addAttribute("resultModals", resultModals);
                return "calendar";
            } else {
                return "redirect:/";
            }
        } catch (Exception exception) {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "/calendarInsert", method = RequestMethod.POST)
    public String insertEvent(Model m, HttpServletRequest request) throws ParseException {
        try {
            HttpSession session = request.getSession(false);
            if (session.getAttribute("token") != null) {
                String token = (String) session.getAttribute("token");

                if (!request.getParameter("summary").trim().equals("")) {
                    String summary;
                    if (request.getParameter("descr").trim().equals("")) {
                        summary = request.getParameter("summary").trim() + " = Please Add Description";
                    } else {
                        summary = request.getParameter("summary").trim() + " = " + request.getParameter("descr").trim();
                    }

                    String endTime = request.getParameter("endTime");
                    String startTime = request.getParameter("startTime");
                    String startDate = request.getParameter("startDate") + "T" + startTime + "-01:00";
                    String endDate = request.getParameter("endDate") + "T" + endTime + "-01:00";

                    DateFormat sdf = new SimpleDateFormat("MM/dd/yyyy'T'HH:mm:ss-HH:mm");
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss-HH:mm");
                    Date date = sdf.parse(startDate);
                    startDate = simpleDateFormat.format(date);
                    date = sdf.parse(endDate);
                    endDate = simpleDateFormat.format(date);

                    Booking booking = new Booking(new End(endDate, "Europe/Amsterdam"), new Start(startDate, "Europe/Amsterdam"), summary, "Custom", "");
                    boolean result = calendarService.insertEvent(token, booking);
                    return "redirect:calendar?" + result;
                }
                return "redirect:calendar?summaryError";
            } else {
                return "redirect:/";
            }
        } catch (ParseException exception) {
            return "redirect:/" + exception.fillInStackTrace().toString();
        }
    }

    @RequestMapping(value = "/removeEvent", method = RequestMethod.POST)
    public String removeEvent(Model m, HttpServletRequest request) throws ParseException {
        HttpSession session = request.getSession(false);
        if (session.getAttribute("token") != null) {
            String token = (String) session.getAttribute("token");
            String eventId = request.getParameter("eventId");
            boolean result = calendarService.removeEvent(token, new Event(eventId));
            return "redirect:calendar?" + result;
        } else {
            return "redirect:/";
        }
    }
}
