package com.ufpr.tads.web2.beans;

import java.io.Serializable;

/**
 * @author Ronaldo
 */

public class LoginBean implements Serializable {
    private int id;
    private String nome;
    private String senha;
    
    public LoginBean() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
