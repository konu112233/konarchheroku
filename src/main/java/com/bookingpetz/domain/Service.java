/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author burakzengin
 */
@Table(name = "service", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"serviceId"})})
public class Service implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "serviceId", unique = true, nullable = false, length = 11)
    private int serviceId;

    @Column(name = "userId", nullable = true, length = 45)
    private String userId;

    @Column(name = "name", nullable = true, length = 45)
    private String name;

    @Column(name = "type", nullable = true, length = 45)
    private String type;

    @Column(name = "description", nullable = true, length = 45)
    private String description;

    @Column(name = "basePrice", nullable = false, length = 11)
    private int basePrice;

    public Service() {
    }

    public Service(String userId, String name, String type, String description, int basePrice) {
        this.userId = userId;
        this.name = name;
        this.type = type;
        this.description = description;
        this.basePrice = basePrice;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(int basePrice) {
        this.basePrice = basePrice;
    }

}
