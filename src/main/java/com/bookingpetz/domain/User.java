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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author burakzengin
 */
@Table(name = "user", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"userId"})})
public class User implements Serializable {

    @Id
    @Column(name = "userId")
    private String userId;

    @Column(name = "email", nullable = false, length = 25)
    private String email;

    @Column(name = "name", nullable = false, length = 45)
    private String name;

    @Column(name = "surname", nullable = false, length = 45)
    private String surname;

    @Column(name = "pkey", nullable = false, length = 500)
    private String pkey;

    @Column(name = "salt", nullable = false, length = 800)
    private String salt;

    @Column(name = "enable", nullable = false, length = 45)
    private String enable;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "userId")
    private List<Contact> contactList = new ArrayList<>();

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "userId")
    private Hotel hotel;

    public User() {
    }

    public User(String userId) {
        this.userId = userId;
    }

    public User(String email, String name, String surname, String pkey, String enable) {
        this.email = email;
        this.name = name;
        this.surname = surname;
        this.pkey = pkey;
        this.enable = enable;
    }

    public User(String userId, String email, String name, String surname, String pkey, String salt, String enable) {
        this.userId = userId;
        this.email = email;
        this.name = name;
        this.surname = surname;
        this.pkey = pkey;
        this.salt = salt;
        this.enable = enable;
    }

    public User(String userId, String email, String name, String surname, String pkey, String salt, String enable, List<Contact> contactList) {
        this.userId = userId;
        this.email = email;
        this.name = name;
        this.surname = surname;
        this.pkey = pkey;
        this.salt = salt;
        this.enable = enable;
        this.contactList = contactList;
    }

    public User(String userId, String email, String name, String surname, String pkey, String salt, String enable, List<Contact> contactList, Hotel hotel) {
        this.userId = userId;
        this.email = email;
        this.name = name;
        this.surname = surname;
        this.pkey = pkey;
        this.salt = salt;
        this.enable = enable;
        this.contactList = contactList;
        this.hotel = hotel;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public List<Contact> getContactList() {
        return contactList;
    }

    public void setContactList(List<Contact> contactList) {
        this.contactList = contactList;
    }

    public String getPkey() {
        return pkey;
    }

    public void setPkey(String pkey) {
        this.pkey = pkey;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

}
