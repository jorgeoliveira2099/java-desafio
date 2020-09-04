package com.localhost.main.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.localhost.main.dao.TelefoneTipoDao;
import com.localhost.main.dao.UsuarioDao;
import com.localhost.main.dao.UsuarioTelefoneDao;
import com.localhost.main.model.TelefoneTipo;
import com.localhost.main.model.Usuario;
import com.localhost.main.model.UsuarioTelefone;


@WebServlet(description = "Administra as partiçoes para a tabela usuario", urlPatterns = { "/usuario" })
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;       
   
    public UsuarioController() {
        super();
       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String opcao = request.getParameter("opcao");
		
		if (opcao.equals("criar")) {
			TelefoneTipoDao telefoneTipoDao = new TelefoneTipoDao();
			List<TelefoneTipo> lista = new ArrayList<>();

			try {
				lista = telefoneTipoDao.listarTelefoneTipo();

				for (TelefoneTipo telefoneTipo : lista) {
					System.out.println(telefoneTipo);
				}
				
				request.setAttribute("lista", lista);
				System.out.println("Pressionou a op�aoo de criar");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/criar.jsp");
				requestDispatcher.forward(request, response);
			} catch (SQLException e) {				
				e.printStackTrace();
			}			
			
		} else if (opcao.equals("listar")) {
			UsuarioDao usuarioDao = new UsuarioDao();
			List<Usuario> arrayUsuario = new ArrayList<>();
			UsuarioTelefoneDao usuarioTelefoneDao = new UsuarioTelefoneDao();
			List<ArrayList<UsuarioTelefone>> arrayUsuarioTelefone = new ArrayList<>();
			TelefoneTipoDao telefoneTipoDao = new TelefoneTipoDao();
			List<ArrayList<TelefoneTipo>> arrayTelefoneTipo = new ArrayList<>();
			
			try {

				arrayUsuario = usuarioDao.listarUsuarios();

				for (Usuario usuario : arrayUsuario) {
					arrayUsuarioTelefone.add((ArrayList<UsuarioTelefone>) usuarioTelefoneDao.listarUsuarioTelefone(usuario.getId_usuario()));
				}
				for(int i = 0; i < arrayUsuarioTelefone.size(); i++) {
					if (arrayUsuarioTelefone.get(i).isEmpty()) {
						arrayTelefoneTipo.add(null);
						System.out.println("é vazio");
						continue;
					}
					ArrayList<TelefoneTipo> listTelefoneTipo = new ArrayList<>();
					for (UsuarioTelefone usuarioTelefone : arrayUsuarioTelefone.get(i)) {
						listTelefoneTipo.addAll((ArrayList<TelefoneTipo>) telefoneTipoDao.listarTelefoneTipoPorID(usuarioTelefone.getId_telefone_tipo()));
					}

					arrayTelefoneTipo.add(new ArrayList<>(listTelefoneTipo));
				}

				request.setAttribute("arrayUsuario", arrayUsuario);
				request.setAttribute("arrayUsuarioTelefone", arrayUsuarioTelefone);
				request.setAttribute("arrayTelefoneTipo", arrayTelefoneTipo);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/listar.jsp");
				requestDispatcher.forward(request, response);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
			System.out.println("Pressionou a opção de listar");
		} else if(opcao.equals("meditar")) {
			int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
			System.out.println("Editar id: "+ id_usuario);

			UsuarioDao usuarioDAO = new UsuarioDao();
			Usuario u = new Usuario();
			UsuarioTelefoneDao usuarioTelefoneDAO = new UsuarioTelefoneDao();
			List<UsuarioTelefone> arrayUsuarioTelefone = new ArrayList<>();
			TelefoneTipoDao telefoneTipoDao = new TelefoneTipoDao();
			List<TelefoneTipo> listaTiposTelefone = new ArrayList<>();
			
			try {
				u = usuarioDAO.listarUsuario(id_usuario);
				arrayUsuarioTelefone = usuarioTelefoneDAO.listarUsuarioTelefone(u.getId_usuario());
				listaTiposTelefone = telefoneTipoDao.listarTelefoneTipo();
				System.out.println(listaTiposTelefone);
				request.setAttribute("usuario", u);
				request.setAttribute("arrayUsuarioTelefone", arrayUsuarioTelefone);
				request.setAttribute("listaTiposTelefone", listaTiposTelefone);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/editar.jsp");
				requestDispatcher.forward(request, response);
				
			} catch (SQLException e) {			
				e.printStackTrace();
			}
		} else if (opcao.equals("deletar")) {
			UsuarioDao usuarioDao = new UsuarioDao();
			UsuarioTelefoneDao usuarioTelefoneDAO = new UsuarioTelefoneDao();

			int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
			try {
				usuarioDao.deletarUsuario(id_usuario);
				System.out.println("Exclusão do id " + request.getParameter("id_usuario") + " realizado com sucesso!");
				usuarioTelefoneDAO.deletarTodosOsNumerosDoUsuario(id_usuario);
				System.out.println("Exclusão de todos os números do id " + request.getParameter("id_usuario") + " realizado com sucesso!");

				HttpSession session=request.getSession();  
				session.setAttribute("msgAviso", "Exclusao realizada com sucesso!");
				session.setAttribute("msgAvisoCor", "green");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/principal.jsp");
				requestDispatcher.forward(request, response);

			} catch (SQLException e) {				
				e.printStackTrace();
			}
		} else if(opcao.equals("voltar")) {
			String url = "";
			HttpSession session = request.getSession();
			if(session.getAttribute("usuario") == null || session.getAttribute("usuario") == "") {
				url = "index.jsp";
			}
			else {
				String view = request.getParameter("view");
				url = "views/"+view;
			}
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
			requestDispatcher.forward(request, response);
		}			
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcao = request.getParameter("opcao");
		
		if (opcao.equals("guardar")) {
			UsuarioDao usuarioDao = new UsuarioDao();
			UsuarioTelefoneDao usuarioTelefoneDao = new UsuarioTelefoneDao();
			Usuario usuario = new Usuario();
			usuario.setNome(request.getParameter("nome"));
			usuario.setEmail(request.getParameter("email"));
			usuario.setSenha(request.getParameter("senha"));

			try {
				int id_usuario = (int) usuarioDao.inserirUsuario(usuario);
				
				if (request.getParameter("id_telefone_tipo01") != "") {
					UsuarioTelefone usuarioTelefone = new UsuarioTelefone();
					usuarioTelefone.setId_telefone_tipo(Integer.parseInt(request.getParameter("id_telefone_tipo01")));
					usuarioTelefone.setNumero_telefone(request.getParameter("telefone01"));
					usuarioTelefone.setDdd(Integer.parseInt(request.getParameter("ddd01")));
					usuarioTelefone.setId_usuario(id_usuario);	
					usuarioTelefoneDao.inserirUsuarioTelefone(usuarioTelefone);
				}
				
				if (request.getParameter("id_telefone_tipo02") != "") {
					UsuarioTelefone usuarioTelefone = new UsuarioTelefone();
					usuarioTelefone.setId_telefone_tipo(Integer.parseInt(request.getParameter("id_telefone_tipo02")));
					usuarioTelefone.setNumero_telefone(request.getParameter("telefone02"));
					usuarioTelefone.setDdd(Integer.parseInt(request.getParameter("ddd02")));
					usuarioTelefone.setId_usuario(id_usuario);	
					usuarioTelefoneDao.inserirUsuarioTelefone(usuarioTelefone);			
				}
				
				System.out.println("Cadastro realizado com sucesso!");
				HttpSession session=request.getSession();  
				session.setAttribute("msgAviso", "Cadastro realizado com sucesso!");
				session.setAttribute("msgAvisoCor", "green");
				if(session.getAttribute("usuario") == null || session.getAttribute("usuario") == ""){
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");					
					requestDispatcher.forward(request, response);
				}
				else {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/principal.jsp");					
					requestDispatcher.forward(request, response);					
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
		}else if (opcao.equals("editar")) {
			UsuarioDao usuarioDao = new UsuarioDao();
			Usuario usuario = new Usuario();
			UsuarioTelefoneDao usuarioTelefoneDAO = new UsuarioTelefoneDao();			
			
			usuario.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
			usuario.setNome(request.getParameter("nome"));
			usuario.setEmail(request.getParameter("email"));
			usuario.setSenha(request.getParameter("senha"));
			
			try {
				usuarioDao.alterarUsuario(usuario);
				System.out.println("Edição do usuario id " + request.getParameter("id_usuario") + " realizado com sucesso!");
				usuarioTelefoneDAO.deletarTodosOsNumerosDoUsuario(Integer.parseInt(request.getParameter("id_usuario")));
				System.out.println("Exclusão de todos os números do id " + request.getParameter("id_usuario") + " realizado com sucesso!");
				
				if (request.getParameter("id_telefone_tipo01") != "") {
					UsuarioTelefone usuarioTelefone = new UsuarioTelefone();
					usuarioTelefone.setId_telefone_tipo(Integer.parseInt(request.getParameter("id_telefone_tipo01")));
					usuarioTelefone.setNumero_telefone(request.getParameter("telefone01"));
					usuarioTelefone.setDdd(Integer.parseInt(request.getParameter("ddd01")));
					usuarioTelefone.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));	
					usuarioTelefoneDAO.inserirUsuarioTelefone(usuarioTelefone);
					System.out.println("Criação do 1º numero do usuario id " + request.getParameter("id_usuario") + " realizado com sucesso!");
				}
				
				if (request.getParameter("id_telefone_tipo02") != "") {
					UsuarioTelefone usuarioTelefone = new UsuarioTelefone();
					usuarioTelefone.setId_telefone_tipo(Integer.parseInt(request.getParameter("id_telefone_tipo02")));
					usuarioTelefone.setNumero_telefone(request.getParameter("telefone02"));
					usuarioTelefone.setDdd(Integer.parseInt(request.getParameter("ddd02")));
					usuarioTelefone.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));	
					usuarioTelefoneDAO.inserirUsuarioTelefone(usuarioTelefone);
					System.out.println("Criação do 2º numero do usuario ido usuario id " + request.getParameter("id_usuario") + " realizado com sucesso!");
			
				}

				HttpSession session=request.getSession();  
				session.setAttribute("msgAviso", "Edição realizada com sucesso!");
				session.setAttribute("msgAvisoCor", "green");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/principal.jsp");
				requestDispatcher.forward(request, response);

			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}		
	}

}

