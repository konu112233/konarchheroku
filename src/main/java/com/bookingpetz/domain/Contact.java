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
@Table(name = "contact", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
public class Contact implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false, length = 11)
    private int id;

    @Column(name = "userId", nullable = true, length = 11)
    private int userId;

    @Column(name = "phone", nullable = true, length = 25)
    private String phone;

    @Column(name = "website", nullable = true, length = 45)
    private String website;

    @Column(name = "description", nullable = true, length = 200)
    private String description;

    public Contact() {
    }

    public Contact(int userId, String phone, String website, String description) {
        this.userId = userId;
        this.phone = phone;
        this.website = website;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
