package com.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.entities.Message;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	
    
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession s = req.getSession();
		s.removeAttribute("currentUser");
		
		Message m = new Message("Logout Successful.","success","alert-success");
		
		s.setAttribute("msg", m);
		res.sendRedirect("Login.jsp");
		
	}

}
