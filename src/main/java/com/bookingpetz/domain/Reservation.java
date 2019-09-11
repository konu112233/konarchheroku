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
@Table(name = "reservation", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"reservationId"})})
public class Reservation implements Serializable {

    @Id
    @Column(name = "reservationId")
    private int reservationId;

    @Column(name = "checkIn", nullable = true, length = 20)
    private String checkIn;

    @Column(name = "checkOut", nullable = true, length = 20)
    private String checkOut;

    @Column(name = "service", nullable = true, length = 200)
    private String service;

    @Column(name = "totalPrice", nullable = true, length = 10)
    private String totalPrice;

    @Column(name = "hotelId", nullable = true, length = 200)
    private String hotelId;

    @Column(name = "hotelName", nullable = true, length = 50)
    private String hotelName;

    @Column(name = "petOwnerId", nullable = true, length = 200)
    private String petOwnerId;

    @Column(name = "petOwnerName", nullable = true, length = 50)
    private String petOwnerName;

    @Column(name = "petOwnerPhone", nullable = true, length = 50)
    private String petOwnerPhone;

    @Column(name = "petOwnerEmail", nullable = true, length = 50)
    private String petOwnerEmail;

    @Column(name = "petId", nullable = true, length = 200)
    private String petId;

    @Column(name = "petName", nullable = true, length = 50)
    private String petName;

    @Column(name = "petBreed", nullable = true, length = 50)
    private String petBreed;

    @Column(name = "petSize", nullable = true, length = 50)
    private String petSize;

    @Column(name = "petGender", nullable = true, length = 50)
    private String petGender;

    @Column(name = "petAge", nullable = true, length = 50)
    private String petAge;

    @Column(name = "petVaccination", nullable = true, length = 20)
    private String petVaccination;

    @Column(name = "status", nullable = true, length = 50)
    private String status;

    public Reservation() {
    }

    public Reservation(int reservationId, String checkIn, String checkOut, String service, String totalPrice, String hotelId, String hotelName, String petOwnerId, String petOwnerName, String petOwnerPhone, String petOwnerEmail, String petId, String petName, String petBreed, String petSize, String petGender, String petAge, String petVaccination, String status) {
        this.reservationId = reservationId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.service = service;
        this.totalPrice = totalPrice;
        this.hotelId = hotelId;
        this.hotelName = hotelName;
        this.petOwnerId = petOwnerId;
        this.petOwnerName = petOwnerName;
        this.petOwnerPhone = petOwnerPhone;
        this.petOwnerEmail = petOwnerEmail;
        this.petId = petId;
        this.petName = petName;
        this.petBreed = petBreed;
        this.petSize = petSize;
        this.petGender = petGender;
        this.petAge = petAge;
        this.petVaccination = petVaccination;
        this.status = status;
    }

    public int getId() {
        return reservationId;
    }

    public void setId(int reservationId) {
        this.reservationId = reservationId;
    }

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getHotelId() {
        return hotelId;
    }

    public void setHotelId(String hotelId) {
        this.hotelId = hotelId;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getPetOwnerId() {
        return petOwnerId;
    }

    public void setPetOwnerId(String petOwnerId) {
        this.petOwnerId = petOwnerId;
    }

    public String getPetOwnerName() {
        return petOwnerName;
    }

    public void setPetOwnerName(String petOwnerName) {
        this.petOwnerName = petOwnerName;
    }

    public String getPetOwnerPhone() {
        return petOwnerPhone;
    }

    public void setPetOwnerPhone(String petOwnerPhone) {
        this.petOwnerPhone = petOwnerPhone;
    }

    public String getPetOwnerEmail() {
        return petOwnerEmail;
    }

    public void setPetOwnerEmail(String petOwnerEmail) {
        this.petOwnerEmail = petOwnerEmail;
    }

    public String getPetId() {
        return petId;
    }

    public void setPetId(String petId) {
        this.petId = petId;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getPetBreed() {
        return petBreed;
    }

    public void setPetBreed(String petBreed) {
        this.petBreed = petBreed;
    }

    public String getPetSize() {
        return petSize;
    }

    public void setPetSize(String petSize) {
        this.petSize = petSize;
    }

    public String getPetGender() {
        return petGender;
    }

    public void setPetGender(String petGender) {
        this.petGender = petGender;
    }

    public String getPetAge() {
        return petAge;
    }

    public void setPetAge(String petAge) {
        this.petAge = petAge;
    }

    public String getPetVaccination() {
        return petVaccination;
    }

    public void setPetVaccination(String petVaccination) {
        this.petVaccination = petVaccination;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
