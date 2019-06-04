package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.dao.ClienteDAO;
import java.sql.SQLException;
import java.util.List;

/**
 * @author Ronaldo
 */
public class ClientesFacade {

    public static void inserir(Cliente cliente) throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        dao.insertCliente(cliente);
    }

    public static void alterar(Cliente cliente) throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        dao.updateClienteById(cliente);
    }

    public static Cliente buscar(int id) throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        return dao.selectClienteById(id);
    }

    public static List<Cliente> buscarTodos() throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        return dao.selectCliente();
    }

    public static void excluir(int id) throws SQLException, ClassNotFoundException {
        ClienteDAO dao = new ClienteDAO();
        dao.deleteClienteById(id);
    }
}
