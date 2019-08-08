/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author burakzengin
 */
@Entity
@Table(name = "service", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"serviceId"})})
public class Service implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "serviceId", unique = true, nullable = false, length = 11)
    private String serviceId;

    @Column(name = "userId", nullable = false, length = 11)
    private int userId;

    @Column(name = "name", nullable = false, length = 45)
    private String name;

    @Column(name = "type", nullable = false, length = 45)
    private String type;

    @Column(name = "description", nullable = false, length = 45)
    private String description;

    @Column(name = "basePrice", nullable = false, length = 11)
    private int basePrice;

    public Service(int userId, String name, String type, String description, int basePrice) {
        this.userId = userId;
        this.name = name;
        this.type = type;
        this.description = description;
        this.basePrice = basePrice;
    }

    public Service() {
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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
