package com.ufpr.tads.web2.beans;

import java.io.Serializable;

/**
 * @author Ronaldo
 */

public class ConfigBean implements Serializable {
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}