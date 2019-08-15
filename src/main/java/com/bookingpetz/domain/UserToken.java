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

    private String id;
    private String access_token;
    private String scope;
    private String token_type;
    private String refresh_token;
    private int expires_in;

    public UserToken(String access_token, String scope, String token_type, String refresh_token, int expires_in) {
        this.access_token = access_token;
        this.scope = scope;
        this.token_type = token_type;
        this.refresh_token = refresh_token;
        this.expires_in = expires_in;
    }

    public UserToken(String id) {
        this.id = id;
        this.scope = "";
        this.token_type = "";
        this.refresh_token = "";
        this.expires_in = 0;
    }

    public UserToken() {
    }

    public String getId() {
        return id;
    }

    public void setId(String Id) {
        this.id = Id;
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

    public String getRefresh_token() {
        if (refresh_token.contains("/")) {
            refresh_token = refresh_token.replace("/", "%2F");
        }
        return refresh_token;
    }

    public void setRefresh_token(String refresh_token) {
        this.refresh_token = refresh_token;
    }

    public int getExpires_in() {
        return expires_in;
    }

    public void setExpires_in(int expires_in) {
        this.expires_in = expires_in;
    }

}
