/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author burakzengin
 */
@Table(name = "address", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
public class Address implements Serializable {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "propertyName", nullable = true, length = 100)
    private String propertyName;

    @Column(name = "aptNo", nullable = true, length = 45)
    private String aptNo;

    @Column(name = "street", nullable = true, length = 45)
    private String street;

    @Column(name = "city", nullable = true, length = 45)
    private String city;

    @Column(name = "states", nullable = true, length = 45)
    private String states;

    @Column(name = "country", nullable = true, length = 45)
    private String country;

    @Column(name = "zipcode", nullable = true, length = 45)
    private String zipcode;

    public Address() {
    }

    public Address(int id, String propertyName, String aptNo, String street, String city, String states, String country, String zipcode) {
        this.id = id;
        this.propertyName = propertyName;
        this.aptNo = aptNo;
        this.street = street;
        this.city = city;
        this.states = states;
        this.country = country;
        this.zipcode = zipcode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAptNo() {
        return aptNo;
    }

    public void setAptNo(String aptNo) {
        this.aptNo = aptNo;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getState() {
        return states;
    }

    public void setState(String states) {
        this.states = states;
    }

}
