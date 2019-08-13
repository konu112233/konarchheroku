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
public class ResultModal {

    private String id;
    private int endYear;
    private int endMonth;
    private int endDay;
    private int startYear;
    private int startMonth;
    private int startDay;
    private String customerId;
    private String customerName;

    public ResultModal(String eventId, int endYear, int endMonth, int endDay, int startYear, int startMonth, int startDay, String customerId, String customerName) {
        this.id = eventId;
        this.endYear = endYear;
        this.endMonth = endMonth;
        this.endDay = endDay;
        this.startYear = startYear;
        this.startMonth = startMonth;
        this.startDay = startDay;
        this.customerId = customerId;
        this.customerName = customerName;
    }

    public ResultModal() {
    }

    public int getEndYear() {
        return endYear;
    }

    public void setEndYear(int endYear) {
        this.endYear = endYear;
    }

    public int getEndMonth() {
        return endMonth;
    }

    public void setEndMonth(int endMonth) {
        this.endMonth = endMonth;
    }

    public int getEndDay() {
        return endDay;
    }

    public void setEndDay(int endDay) {
        this.endDay = endDay;
    }

    public int getStartYear() {
        return startYear;
    }

    public void setStartYear(int startYear) {
        this.startYear = startYear;
    }

    public int getStartMonth() {
        return startMonth;
    }

    public void setStartMonth(int startMonth) {
        this.startMonth = startMonth;
    }

    public int getStartDay() {
        return startDay;
    }

    public void setStartDay(int startDay) {
        this.startDay = startDay;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
