/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

import java.util.List;

/**
 *
 * @author burakzengin
 */
public class SearchResult {

    String hotelId;

    String phone;
    String website;
    String description;
    String bookingEmail;
    String contactName;
    String directions;

    String aptNo;
    String street;
    String city;
    String country;
    String zipcode;
    String propertyName;

    int capacity;
    double rate;
    List<Service> serviceList;

    public SearchResult() {
    }

    public SearchResult(User user) {
        this.hotelId = user.getUserId();
        this.phone = user.getContactList().get(0).getPhone();
        this.website = user.getContactList().get(0).getWebsite();
        this.description = user.getContactList().get(0).getDescription();
        this.bookingEmail = user.getContactList().get(0).getBookingEmail();
        this.contactName = user.getContactList().get(0).getContactName();
        this.directions = user.getContactList().get(0).getDirections();
        this.aptNo = user.getContactList().get(0).getAddress().getAptNo();
        this.street = user.getContactList().get(0).getAddress().getStreet();
        this.city = user.getContactList().get(0).getAddress().getCity();
        this.country = user.getContactList().get(0).getAddress().getCountry();
        this.zipcode = user.getContactList().get(0).getAddress().getZipcode();
        this.propertyName = user.getContactList().get(0).getAddress().getPropertyName();
        this.capacity = user.getHotel().getCapacity();
        this.rate = user.getHotel().getRate();
        this.serviceList = user.getHotel().getServiceList();
    }

    public SearchResult(String hotelId, String phone, String website, String description, String bookingEmail, String contactName, String directions, String aptNo, String street, String city, String country, String zipcode, String propertyName, int capacity, double rate, List<Service> serviceList) {
        this.hotelId = hotelId;
        this.phone = phone;
        this.website = website;
        this.description = description;
        this.bookingEmail = bookingEmail;
        this.contactName = contactName;
        this.directions = directions;
        this.aptNo = aptNo;
        this.street = street;
        this.city = city;
        this.country = country;
        this.zipcode = zipcode;
        this.propertyName = propertyName;
        this.capacity = capacity;
        this.rate = rate;
        this.serviceList = serviceList;
    }

    public String getHotelId() {
        return hotelId;
    }

    public void setHotelId(String hotelId) {
        this.hotelId = hotelId;
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

    public String getBookingEmail() {
        return bookingEmail;
    }

    public void setBookingEmail(String bookingEmail) {
        this.bookingEmail = bookingEmail;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getDirections() {
        return directions;
    }

    public void setDirections(String directions) {
        this.directions = directions;
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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public List<Service> getServiceList() {
        return serviceList;
    }

    public void setServiceList(List<Service> serviceList) {
        this.serviceList = serviceList;
    }

}
