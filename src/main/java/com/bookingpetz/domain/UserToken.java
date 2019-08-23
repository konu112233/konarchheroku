/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bookingpetz.domain;

import java.io.Serializable;

/**
 *
 * @author burakzengin
 */
public class UserToken implements Serializable {

    private String access_token;
    private String scope;
    private String token_type;
    private int expires_in;
    private User user;

    public UserToken(String access_token, String scope, String token_type, int expires_in, User user) {
        this.access_token = access_token;
        this.scope = scope;
        this.token_type = token_type;
        this.expires_in = expires_in;
        this.user = user;
    }

    public UserToken() {
        this.scope = "";
        this.token_type = "";
        this.expires_in = 0;
        this.user = new User("000");
    }

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getToken_type() {
        return token_type;
    }

    public void setToken_type(String token_type) {
        this.token_type = token_type;
    }

    public int getExpires_in() {
        return expires_in;
    }

    public void setExpires_in(int expires_in) {
        this.expires_in = expires_in;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
