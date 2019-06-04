package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.facade.CidadeFacade;
import com.ufpr.tads.web2.facade.EstadoFacade;
import com.ufpr.tads.web2.facade.ClientesFacade;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Ronaldo
 */
@WebServlet(name = "ClientesServlet", urlPatterns = {"/ClientesServlet"})
public class ClientesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            LoginBean log = (LoginBean) session.getAttribute("login");
            if (log == null) {
                request.setAttribute("msg", "USUÁRIO DEVE SE AUTENTICAR PARA ACESSAR O SISTEMA");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
                return;
            }

            int id;
            Cliente cliente;
            List<Cliente> clientes;
            RequestDispatcher rd;
            String action = request.getParameter("action");

            if (action != null) {
                switch (action) {
                    case "show":
                        id = Integer.parseInt(request.getParameter("id"));
                        cliente = ClientesFacade.buscar(id);
                        request.setAttribute("visualizar", cliente);
                        rd = getServletContext().getRequestDispatcher("/clientesVisualizar.jsp");
                        rd.forward(request, response);
                        break;
                    case "formUpdate":
                        id = Integer.parseInt(request.getParameter("id"));
                        cliente = ClientesFacade.buscar(id);
                        List<Estado> estados = new ArrayList<>();
                        estados = EstadoFacade.buscarTodosEstados();
                        request.setAttribute("alterar", cliente);
                        request.setAttribute("estados", estados);
                       /* System.out.println("ESTADOS: " + estados.size());*/

                        rd = getServletContext().getRequestDispatcher("/clientesForm.jsp?form=alterar");
                        rd.forward(request, response);
                        break;
                    case "remove":
                        id = Integer.parseInt(request.getParameter("id"));
                        ClientesFacade.excluir(id);
                        response.sendRedirect(request.getContextPath() + "/ClientesServlet");
                        break;
                    case "update":
                        cliente = new Cliente();
                        id = Integer.parseInt(request.getParameter("id"));
                        cliente.setId(id);
                        cliente.setCpf(request.getParameter("cpf"));
                        cliente.setNome(request.getParameter("nome"));
                        cliente.setEmail(request.getParameter("email"));
                        String dataString = request.getParameter("data");
                        DateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                        try {
                            Date data = new Date(frmt.parse(dataString).getTime());
                            cliente.setData(data);
                        } catch (ParseException ex) {
                            Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        cliente.setCep(request.getParameter("cep"));
                        cliente.setRua(request.getParameter("rua"));
                        int numero = Integer.parseInt(request.getParameter("nr"));
                        cliente.setNr(numero);
                        int cidadeId = Integer.parseInt(request.getParameter("cidade"));
                        Cidade cid = CidadeFacade.buscarCidade(cidadeId);
                        cliente.setCidade(cid);
                        ClientesFacade.alterar(cliente);
                        rd = getServletContext().getRequestDispatcher("/ClientesServlet?action=list");
                        rd.forward(request, response);
                        break;
                    case "formNew":
                       
                                    List<Estado> estado = new ArrayList<>();
                                    estado = EstadoFacade.buscarTodosEstados();
                                    request.setAttribute("estados", estado);
                                    rd = getServletContext().getRequestDispatcher("/clientesForm.jsp");
                                    rd.forward(request, response);
                                  
                             break;
                    case "new":
                        cliente = new Cliente();
                        cliente.setNome(request.getParameter("nome"));
                        cliente.setCpf(request.getParameter("cpf"));
                        cliente.setEmail(request.getParameter("email"));
                        
                        
                        
                        String dataString2 = request.getParameter("data");
                        DateFormat frmt2 = new SimpleDateFormat("yyyy-MM-dd");
                        Date data = new Date(frmt2.parse(dataString2).getTime());
                        cliente.setData(data);
                        
                        
                        cliente.setCep(request.getParameter("cep"));
                        cliente.setRua(request.getParameter("rua"));
                        int nr = Integer.parseInt(request.getParameter("nr"));
                        cliente.setNr(nr);
                        int idCidade = Integer.parseInt(request.getParameter("cidade"));
                        Cidade cidadeC = CidadeFacade.buscarCidade(idCidade);
                        cliente.setCidade(cidadeC);
                        ClientesFacade.inserir(cliente);
                        rd = getServletContext().getRequestDispatcher("/ClientesServlet?action=list");
                        rd.forward(request, response);
                        break;
                    default:
                        clientes = ClientesFacade.buscarTodos();
                        request.setAttribute("listar", clientes);
                        rd = getServletContext().getRequestDispatcher("/clientesListar.jsp");
                        rd.forward(request, response);
                }
            } else {
                clientes = ClientesFacade.buscarTodos();
                request.setAttribute("listar", clientes);
                rd = getServletContext().getRequestDispatcher("/clientesListar.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ClientesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
