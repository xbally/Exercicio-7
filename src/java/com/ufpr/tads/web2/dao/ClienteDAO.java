package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Estado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Ronaldo
 */
public class ClienteDAO {

    private Connection conn;

    public ClienteDAO() throws SQLException, ClassNotFoundException {
        this.conn = ConnectionFactory.getConnection();
    }

    public List<Cliente> selectCliente() throws SQLException {

        List<Cliente> resultado = new ArrayList<>();
        String sql = "SELECT cl.*, ci.nome_cidade, es.*  FROM tb_cliente cl, tb_cidade ci, tb_estado es WHERE cl.id_cidade = ci.id_cidade AND ci.id_estado = es.id_estado  ORDER BY id_cliente;";
        PreparedStatement st = conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("id_cliente"));
            cliente.setCpf(rs.getString("cpf_cliente"));
            cliente.setNome(rs.getString("nome_cliente"));
            cliente.setEmail(rs.getString("email_cliente"));
            cliente.setData(rs.getDate("data_cliente"));
            cliente.setRua(rs.getString("rua_cliente"));
            cliente.setNr(rs.getInt("nr_cliente"));
            cliente.setCep(rs.getString("cep_cliente"));
            Cidade cidade = new Cidade();
            cidade.setId(rs.getInt("id_cidade"));
            cidade.setNome(rs.getString("nome_cidade"));
            Estado estado = new Estado();
            estado.setId(rs.getInt("id_estado"));
            estado.setNome(rs.getString("nome_estado"));
            estado.setSigla(rs.getString("sigla_estado"));
            cidade.setEstado(estado);
            cliente.setCidade(cidade);
            resultado.add(cliente);
        }
        return resultado;
    }

    public Cliente selectClienteById(int id) throws SQLException {

        Cliente cliente = new Cliente();
        String sql = "SELECT cl.*, ci.nome_cidade, es.* FROM tb_cliente cl, tb_cidade ci, tb_estado es  WHERE id_cliente=(?) AND cl.id_cidade = ci.id_cidade AND ci.id_estado = es.id_estado;";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            cliente.setId(rs.getInt(1));
            cliente.setCpf(rs.getString(2));
            cliente.setNome(rs.getString(3));
            cliente.setEmail(rs.getString(4));
            cliente.setData(rs.getDate(5));
            cliente.setRua(rs.getString(6));
            cliente.setNr(rs.getInt(7));
            cliente.setCep(rs.getString(8));
            Cidade cidade = new Cidade();
            cidade.setId(rs.getInt(9));
            cidade.setNome(rs.getString(10));
            Estado estado = new Estado();
            estado.setId(rs.getInt(11));
            estado.setNome(rs.getString(12));
            estado.setSigla(rs.getString(13));
            cidade.setEstado(estado);
            cliente.setCidade(cidade);
        }
        return cliente;
    }

    public void deleteClienteById(int id) throws SQLException {

        String sql = "DELETE FROM tb_cliente WHERE id_cliente = (?);";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1, id);
        st.executeUpdate();
    }

    public void updateClienteById(Cliente cliente) throws SQLException {

        String sql = "UPDATE tb_cliente "
                + "SET cpf_cliente = (?), nome_cliente = (?), email_cliente = (?), data_cliente = (?), cep_cliente = (?), rua_cliente = (?), nr_cliente = (?), "
                + "id_cidade = (?) WHERE id_cliente = (?);";
        PreparedStatement st = conn.prepareStatement(sql);

        st.setString(1, cliente.getCpf());
        st.setString(2, cliente.getNome());
        st.setString(3, cliente.getEmail());
        st.setDate(4, new java.sql.Date(cliente.getData().getTime()));
        st.setString(5, cliente.getCep());
        st.setString(6, cliente.getRua());
        st.setInt(7, cliente.getNr());
        st.setInt(8, cliente.getCidade().getId());
        st.setInt(9, cliente.getId());
        st.executeUpdate();
    }

    public void insertCliente(Cliente cliente) throws SQLException {

        String sql = "INSERT INTO tb_cliente (cpf_cliente, nome_cliente, email_cliente, data_cliente, rua_cliente, nr_cliente, cep_cliente, id_cidade) VALUES ((?), (?), (?), (?), (?),(?) ,(?),(?));";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, cliente.getCpf());
        stmt.setString(2, cliente.getNome());
        stmt.setString(3, cliente.getEmail());
        stmt.setDate(4, new java.sql.Date(cliente.getData().getTime()));
        stmt.setString(5, cliente.getRua());
        stmt.setInt(6, cliente.getNr());
        stmt.setString(7, cliente.getCep());
        stmt.setInt(8, cliente.getCidade().getId());
        stmt.executeUpdate();
    }

}
