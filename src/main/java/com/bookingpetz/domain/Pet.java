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
@Table(name = "pet", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
public class Pet implements Serializable {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "userId", nullable = true, length = 100)
    private String userId;

    @Column(name = "name", nullable = true, length = 25)
    private String name;

    @Column(name = "breed", nullable = true, length = 45)
    private String breed;

    @Column(name = "gender", nullable = true, length = 45)
    private String gender;

    @Column(name = "age", nullable = true, length = 10)
    private String age;

    @Column(name = "petSize", nullable = true, length = 45)
    private String petSize;

    @Column(name = "microchipNo", nullable = true, length = 100)
    private String microchipNo;

    @Column(name = "allergies", nullable = true, length = 100)
    private String allergies;

    @Column(name = "underMedication", nullable = true, length = 100)
    private String underMedication;

    @Column(name = "eatingRoutine", nullable = true, length = 100)
    private String eatingRoutine;

    @Column(name = "sleepingPlace", nullable = true, length = 100)
    private String sleepingPlace;

    @Column(name = "neuteredStreilized", nullable = true, length = 20)
    private String neuteredStreilized;

    @Column(name = "friendly", nullable = true, length = 20)
    private String friendly;

    @Column(name = "getAlongChildren", nullable = true, length = 20)
    private String getAlongChildren;

    @Column(name = "vaccination", nullable = true, length = 20)
    private String vaccination;

    @Column(name = "petType", nullable = true, length = 20)
    private String petType;

    public Pet() {
    }

    public Pet(int id, String userId, String name, String breed, String gender, String age, String petSize, String microchipNo, String allergies, String underMedication, String eatingRoutine, String sleepingPlace, String neuteredStreilized, String friendly, String getAlongChildren, String vaccination, String petType) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.breed = breed;
        this.gender = gender;
        this.age = age;
        this.petSize = petSize;
        this.microchipNo = microchipNo;
        this.allergies = allergies;
        this.underMedication = underMedication;
        this.eatingRoutine = eatingRoutine;
        this.sleepingPlace = sleepingPlace;
        this.neuteredStreilized = neuteredStreilized;
        this.friendly = friendly;
        this.getAlongChildren = getAlongChildren;
        this.vaccination = vaccination;
        this.petType = petType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getPetSize() {
        return petSize;
    }

    public void setPetSize(String petSize) {
        this.petSize = petSize;
    }

    public String getMicrochipNo() {
        return microchipNo;
    }

    public void setMicrochipNo(String microchipNo) {
        this.microchipNo = microchipNo;
    }

    public String getAllergies() {
        return allergies;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    public String getUnderMedication() {
        return underMedication;
    }

    public void setUnderMedication(String underMedication) {
        this.underMedication = underMedication;
    }

    public String getEatingRoutine() {
        return eatingRoutine;
    }

    public void setEatingRoutine(String eatingRoutine) {
        this.eatingRoutine = eatingRoutine;
    }

    public String getSleepingPlace() {
        return sleepingPlace;
    }

    public void setSleepingPlace(String sleepingPlace) {
        this.sleepingPlace = sleepingPlace;
    }

    public String getNeuteredStreilized() {
        return neuteredStreilized;
    }

    public void setNeuteredStreilized(String neuteredStreilized) {
        this.neuteredStreilized = neuteredStreilized;
    }

    public String getFriendly() {
        return friendly;
    }

    public void setFriendly(String friendly) {
        this.friendly = friendly;
    }

    public String getGetAlongChildren() {
        return getAlongChildren;
    }

    public void setGetAlongChildren(String getAlongChildren) {
        this.getAlongChildren = getAlongChildren;
    }

    public String getVaccination() {
        return vaccination;
    }

    public void setVaccination(String vaccination) {
        this.vaccination = vaccination;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

}
