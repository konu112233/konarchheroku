/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author burakzengin
 */
@Entity
@Table(name = "user", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"userId"})})
public class User implements Serializable {

    @Id
    @Column(name = "userId")
    private int userId;

    @Column(name = "email", nullable = false, length = 25)
    private String email;

    @Column(name = "password", nullable = false, length = 45)
    private String password;

    @Column(name = "name", nullable = false, length = 45)
    private String name;

    @Column(name = "surname", nullable = false, length = 45)
    private String surname;

    @JoinColumn(name = "userId")
    @OneToOne(cascade = CascadeType.ALL)
    private Contact contact;

    public User() {
    }

    public User(int userId, String email, String password, String name, String surname, Contact contact) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.contact = contact;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

}
