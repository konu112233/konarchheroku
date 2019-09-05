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
public class Profile {

    String name;
    String surname;
    String phone;
    String email;
    String address;
    String birthday;
    String gender;

    public Profile() {
    }

    public Profile(User user) {
        this.name = user.getName();
        this.surname = user.getSurname();
        this.phone = user.getContactList().get(0).getPhone();
        this.email = user.getEmail();
        this.gender = user.getGender();
        this.birthday = user.getBirthday();
        this.address = user.getContactList().get(0).getAddress().getAptNo() + " " + user.getContactList().get(0).getAddress().getStreet() + " " + user.getContactList().get(0).getAddress().getStates() + " " + user.getContactList().get(0).getAddress().getCity() + " " + user.getContactList().get(0).getAddress().getCountry();
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
