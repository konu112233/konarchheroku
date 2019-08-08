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
public class Search {

    private String timeMax;
    private String timeMin;
    private String timeZone;
    private String petType;
    private String location;

    public Search(String timeMax, String timeMin, String timeZone, String petType, String location) {
        this.timeMax = timeMax;
        this.timeMin = timeMin;
        this.timeZone = timeZone;
        this.petType = petType;
        this.location = location;
    }

    public Search() {
    }

    public String getTimeMax() {
        return timeMax;
    }

    public void setTimeMax(String timeMax) {
        this.timeMax = timeMax;
    }

    public String getTimeMin() {
        return timeMin;
    }

    public void setTimeMin(String timeMin) {
        this.timeMin = timeMin;
    }

    public String getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

}
