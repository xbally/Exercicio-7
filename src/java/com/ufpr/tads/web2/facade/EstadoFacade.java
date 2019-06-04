package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.dao.EstadoDAO;
import java.sql.SQLException;
import java.util.List;

/**
 * @author Ronaldo
 */
public class EstadoFacade {
    public static List<Estado> buscarTodosEstados() throws SQLException, ClassNotFoundException {
        EstadoDAO estadodao = new EstadoDAO();
        return estadodao.getEstados();
    }
    
    public static Estado buscarEstado(int id) throws SQLException, ClassNotFoundException {
        EstadoDAO cidadedao = new EstadoDAO();
        return cidadedao.getEstadoById(id);
    }
}
