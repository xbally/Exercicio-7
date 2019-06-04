package com.ufpr.tads.web2.beans;

import java.io.Serializable;

/**
 * @author Ronaldo
 */
public class Cidade implements Serializable {
    private int id;
    private String nome;
    private Estado estado;

    public Cidade() {

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

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
}
