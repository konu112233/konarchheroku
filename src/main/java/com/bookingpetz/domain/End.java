/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

/**
 *
 * @author burakzengin
 */
public class End {

    private String dateTime;
    private String timeZone;

    public End(String dateTime, String timeZone) {
        this.dateTime = dateTime;
        this.timeZone = timeZone;
    }

    public End() {
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }

}
