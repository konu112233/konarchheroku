/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author burakzengin
 */
@Entity
@Table(name = "address", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
public class Address implements Serializable {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "aptNo", nullable = false, length = 25)
    private String aptNo;

    @Column(name = "street", nullable = false, length = 25)
    private String street;

    @Column(name = "state", nullable = false, length = 25)
    private String state;

    @Column(name = "zipcode", nullable = false, length = 25)
    private String zipcode;

    @Column(name = "country", nullable = false, length = 25)
    private String country;

    public Address() {
    }

    public Address(int id, String aptNo, String street, String state, String zipcode, String country) {
        this.id = id;
        this.aptNo = aptNo;
        this.street = street;
        this.state = state;
        this.zipcode = zipcode;
        this.country = country;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
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

}
