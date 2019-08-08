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
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.json.simple.JSONObject;

/**
 *
 * @author burakzengin
 */
@Entity
@Table(name = "hotel", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"userId"})})
public class Hotel implements Serializable {

    @Id
    @Column(name = "userId")
    private int userId;

    @Column(name = "certificationNumber", length = 11)
    private int certificationNumber;

    @Column(name = "workingHours", length = 45)
    private String workingHours;

    @Column(name = "rooms", length = 3)
    private int rooms;

    @Column(name = "rate")
    private float rate;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "userId")
    private User user;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @Fetch(value = FetchMode.SUBSELECT)
    @JoinColumn(name = "userId")
    private List<Service> serviceList = new ArrayList<>();

    public Hotel(int userId, int certificationNumber, String workingHours, int rooms) {
        this.userId = userId;
        this.certificationNumber = certificationNumber;
        this.workingHours = workingHours;
        this.rooms = rooms;
    }

    public Hotel(int userId, int certificationNumber, String workingHours, int rooms, float rate, User user, List<Service> serviceList) {
        this.userId = userId;
        this.certificationNumber = certificationNumber;
        this.workingHours = workingHours;
        this.rooms = rooms;
        this.user = user;
        this.serviceList = serviceList;
        this.rate = rate;
    }

    public Hotel() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCertificationNumber() {
        return certificationNumber;
    }

    public void setCertificationNumber(int certificationNumber) {
        this.certificationNumber = certificationNumber;
    }

    public String getWorkingHours() {
        return workingHours;
    }

    public void setWorkingHours(String workingHours) {
        this.workingHours = workingHours;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public List<Service> getServiceList() {
        return serviceList;
    }

    public void setServiceList(List<Service> serviceList) {
        this.serviceList = serviceList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public JSONObject toJSON() {
        JSONObject jo = new JSONObject();
        jo.put("userId", userId);
        jo.put("certificationNumber", certificationNumber);
        jo.put("workingHours", workingHours);
        jo.put("rooms", rooms);
        jo.put("rate", rate);
        jo.put("user", user);
        jo.put("service", serviceList);
        return jo;
    }

}
