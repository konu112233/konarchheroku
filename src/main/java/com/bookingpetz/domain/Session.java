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
public class Session {

    private String token;
    private String email;
    private String name;
    private String surname;

    public Session(String token, String email, String name, String surname) {
        this.token = token;
        this.email = email;
        this.name = name;
        this.surname = surname;
    }

    public Session(String token, User user) {
        this.token = token;
        this.email = user.getEmail();
        this.name = user.getName();
        this.surname = user.getSurname();
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
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

}
