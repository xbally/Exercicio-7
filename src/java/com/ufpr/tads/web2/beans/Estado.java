package com.ufpr.tads.web2.beans;

import java.io.Serializable;

/**
 * @author Ronaldo
 */
public class Estado implements Serializable {
    private int id;
    private String nome;
    private String sigla;

    public Estado() {
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

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }
}