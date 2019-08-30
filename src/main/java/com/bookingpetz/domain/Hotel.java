/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import org.json.simple.JSONObject;

/**
 *
 * @author burakzengin
 */
@Table(name = "hotel", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"userId"})})
public class Hotel implements Serializable {

    @Id
    @Column(name = "userId")
    private String userId;

    @Column(name = "workingHours", nullable = true, length = 45)
    private String workingHours;

    @Column(name = "capacity", nullable = true, length = 15)
    private int capacity;

    @Column(name = "rate", nullable = true)
    private double rate;

    @Column(name = "status", nullable = true, length = 25)
    private String status;

    @Column(name = "workingDays", nullable = true, length = 50)
    private String workingDays;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "userId")
    private List<Service> serviceList = new ArrayList<>();

    public Hotel() {
    }

    public Hotel(String userId, String workingHours, int capacity, double rate, String status, List<Service> serviceList, String workingDays) {
        this.userId = userId;
        this.workingHours = workingHours;
        this.capacity = capacity;
        this.serviceList = serviceList;
        this.rate = rate;
        this.status = status;
        this.workingDays = workingDays;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(String workingHours) {
        this.workingHours = workingHours;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public List<Service> getServiceList() {
        return serviceList;
    }

    public void setServiceList(List<Service> serviceList) {
        this.serviceList = serviceList;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getWorkingDays() {
        return workingDays;
    }

    public void setWorkingDays(String workingDays) {
        this.workingDays = workingDays;
    }

    public JSONObject toJSON() {
        JSONObject jo = new JSONObject();
        jo.put("userId", userId);
        jo.put("workingHours", workingHours);
        jo.put("capacity", capacity);
        jo.put("rate", rate);
        jo.put("status", status);
        jo.put("workingDays", workingDays);
        jo.put("service", serviceList);
        return jo;
    }
}
