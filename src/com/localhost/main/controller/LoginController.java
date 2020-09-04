package com.localhost.main.controller;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.localhost.main.dao.UsuarioDao;
import com.localhost.main.model.Usuario;

@WebServlet(description = "Aqui controla o Login", urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;       
    
    public LoginController() {
        super();       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
		requestDispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String opcao = request.getParameter("opcao");
		if (opcao.equals("login")) {
			UsuarioDao usuarioDao = new UsuarioDao();
			Usuario usuario = new Usuario();
			
			try {
				usuario.setEmail(request.getParameter("email"));
				usuario.setSenha(request.getParameter("senha"));
				usuario = usuarioDao.login(usuario);
				HttpSession session=request.getSession();  
		        
				if(usuario.getId_usuario() != 0) {					
					session.setAttribute("usuario", usuario);  
					session.setAttribute("msgAviso", "Login efetudo com sucesso!");
					session.setAttribute("msgAvisoCor", "green");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/principal.jsp");
					requestDispatcher.forward(request, response);
				}
				else {					
					session.setAttribute("msgAviso", "E-mail e/ou senha invalido.");
					session.setAttribute("msgAvisoCor", "red");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
					requestDispatcher.forward(request, response);
				}				
				
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
	
	}

}
