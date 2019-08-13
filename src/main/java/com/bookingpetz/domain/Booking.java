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
public class Booking {

    private End end;
    private Start start;
    private String summary;
    private String kind;
    private String description;
    private String id;

    public Booking() {
    }

    public Booking(String id, End end, Start start, String summary, String kind, String description) {
        this.end = end;
        this.start = start;
        this.summary = summary;
        this.kind = kind;
        this.description = description;
        this.id = id;
    }

    public Booking(End end, Start start, String summary, String kind, String description) {
        this.end = end;
        this.start = start;
        this.summary = summary;
        this.kind = kind;
        this.description = description;
    }

    public End getEnd() {
        return end;
    }

    public void setEnd(End end) {
        this.end = end;
    }

    public Start getStart() {
        return start;
    }

    public void setStart(Start start) {
        this.start = start;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
